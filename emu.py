#!/usr/bin/python

import requests, logging, datetime, sys, pymongo, smtplib
from BeautifulSoup import BeautifulSoup
from pymongo import Connection
from email.mime.text import MIMEText

def mongoConnect(host, port, database, collection):
	connection = Connection(host, port)
	db = connection[database]
	collection = db[collection]
	return collection
	
def notifyUser(user, subject, body):
	msg = MIMEText(body)
	msg['subject'] = subject
	msg['From'] = 'alert@emuflight.com'
	msg['To'] = user
	server = smtplib.SMTP('localhost')
	
	try:
	    server.sendmail(msg['From'], msg['To'] , msg.as_string())
	except Exception, e:
		print "Error: unable to send email"
	
def grabStatus(soupData):
	statusLinks = soupData.findAll('td', { 'class':'track-panel-actualtime' } )
	departLate = statusLinks[0].find('div')['class'].rstrip().lstrip()
	arriveLate = statusLinks[1].find('div')['class'].rstrip().lstrip()
	
	if departLate == 'flightStatusBad':
		departLate = True
	else:
		departLate = False
		
	if arriveLate == 'flightStatusBad':
		arriveLate = True
	else:
		arriveLate = False
		
	cancelled = False
	for status in statusLinks:
		if str(status.find('div').text.replace('&nbsp;', ' ')).lower() == 'cancelled':
			cancelled = True
		
	return [departLate, arriveLate, cancelled]
	
def flightArrive(soupData):
	routeStatus = soupData.find('div', { 'class':'track-panel-inner' }).findAll('tr')[0].find('td').text.lower()
	if routeStatus.find('arrived') > -1 or routeStatus.find('landed') > -1:
		return True
	else:
		return False

headers = { 'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.77 Safari/537.36' }
flights = mongoConnect("localhost", 27017, "emu", "flights")

yesterday = (datetime.datetime.now() + datetime.timedelta(days=-1)).strftime('%Y-%m-%d')
today = datetime.datetime.now().strftime('%Y-%m-%d')
tomorrow = (datetime.datetime.now() + datetime.timedelta(days=1)).strftime('%Y-%m-%d')

for flight in flights.find( { 'status': { '$ne': 'COMPLETE' }, "$or" : [ {'flightDate': today }, {'flightDate': tomorrow }, {'flightDate': yesterday } ] }, {'_id':0} ):
	baseUrl = 'http://flightaware.com/live/flight/id/'
	response = requests.get(baseUrl + flight['flightId'], headers=headers)
	
	soupData = BeautifulSoup(response.content)
	dLate, aLate, cancelled = grabStatus(soupData)
	currentNoti = flight['notifications']

	results = flights.find_one({'flightId': flight['focusFlight']}, {'_id':0})

	body = "Source: %s\n\nDestination:%s\n%s\n\nYour flight: %s" % (flight['source'], flight['destination'], baseUrl + flight['flightId'], baseUrl + flight['focusFlight'])	

	if cancelled:
		message = "[%s][CANCELLED] %s degrees: %s => %s" % (results['flightId'].split("-")[0], str(flight['influence']), flight['sport'], flight['dport'])
		notifyUser(flight['notify'], message, body)
		flights.update( { 'flightId':flight['flightId'] }, { "$set": { 'status': 'COMPLETE', 'cancelled':True } } )
		continue
	
	if dLate or aLate:
		message = "[%s] [DELAYED] %s degrees: %s => %s" % (results['flightId'].split("-")[0], str(flight['influence']), flight['sport'], flight['dport'])
		if 'DELAYED' not in currentNoti:
			notifyUser(flight['notify'], message, body)
			currentNoti.append('DELAYED')
			
		flights.update( { 'flightId':flight['flightId'] }, { "$set": { 'status': 'DELAYED', 'departLate':dLate, 'arriveLate':aLate, 'late': True, 'notifications': currentNoti } } )
		continue
		
	# flight must be on time then
	if flightArrive(soupData):
		print "%s is complete" % flight['flightId']
		flights.update( { 'flightId':flight['flightId'] }, { "$set": { 'status': 'COMPLETE' } } )
	else:
		print "%s hasnt left or is en-route" % flight['flightId']
