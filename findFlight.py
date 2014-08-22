#!/usr/bin/python

import sys
from suds import null, WebFault
from suds.client import Client
import datetime, pytz, calendar, pymongo

from pymongo import Connection

from register import buildChain

def mongoConnect(host, port, database, collection):
	connection = Connection(host, port)
	db = connection[database]
	collection = db[collection]
	return collection

username = '*-YOURUSER-*'
apiKey = '*-YOURKEY-*'
url = 'http://flightxml.flightaware.com/soap/FlightXML2/wsdl'

api = Client(url, username=username, password=apiKey)

preflights = mongoConnect("localhost", 27017, "emu", "preflights")
accounts = mongoConnect("localhost", 27017, "emu", "accounts")

today = datetime.datetime.now().strftime('%Y-%m-%d')
tomorrow = (datetime.datetime.now() + datetime.timedelta(days=1)).strftime('%Y-%m-%d')

for input in preflights.find({'status':'INIT', "$or" : [ {'departureDay': today }, {'departureDay': tomorrow } ] }, {'_id':0}):
	count = input['searchCount']

	success = False
	userTime = input['departureTime'].strftime('%Y-%m-%d')	
	userHour = int(input['departureTime'].strftime('%H'))
	result = api.service.FlightInfoEx(input['tailId'], 5)
	for flight in result['flights']:
		trueTime = datetime.datetime.fromtimestamp(int(flight['filed_departuretime']), tz=pytz.utc).strftime('%Y-%m-%d')
		trueHour = int(datetime.datetime.fromtimestamp(int(flight['filed_departuretime']), tz=pytz.utc).strftime('%H'))
		if userTime == trueTime:
			threshold = [ userHour, userHour + 1, userHour - 1 ]
			if trueHour in threshold:
				success = True
				buildChain(flight['faFlightID'], input['user']) # ADD THE EMAIL PASS TO HERE
				preflights.update({'tailId':input['tailId']}, { "$set": {'status':'TRACKED'}})
			
				account = accounts.find_one({'username':input['user']}, {'_id':0})
				needleHole = [i for i,x in enumerate(account['flights']) if x['tailId'] == input['tailId']][0]
				account['flights'][needleHole]['status'] = "TRACKED"
				
				accounts.update({'username':input['user']}, { "$set": {'flights':account['flights']}})
			
	if not success:
		count += 1
		preflights.update({'tailId':input['tailId']}, { "$set": {'searchCount':count}})
		

