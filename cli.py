import requests, sys, datetime, pymongo
from BeautifulSoup import BeautifulSoup
from pymongo import Connection

def mongoConnect(host, port, database, collection):
	connection = Connection(host, port)
	db = connection[database]
	collection = db[collection]
	return collection

def grabFlights(baseUrl, results=[], breaker=None, count=0, kill=False):	
	if kill:
		return results 
		
	response = requests.get(baseUrl)
	soupData = BeautifulSoup(response.content)
	
	flightDatePanel = soupData.find("div", { 'class':'track-panel-date'} ).string.rstrip().lstrip()
	pyFlightDate = datetime.datetime.strptime(flightDatePanel, '%A, %B %d, %Y')
	
	if breaker == None:
		breaker = (pyFlightDate - datetime.timedelta(days=0))
		
	if breaker > pyFlightDate:
		return results
		
	fullPanel = soupData.find("div", { 'id':'polling-flight_status' })
	flightId = str(fullPanel.find("script").string.split("'")[1])
	flightDate = pyFlightDate.strftime('%Y-%m-%d')
	
	trackerPanel = soupData.find("div", { 'class':'track-panel-header-title'} )
	trackerUrl = trackerPanel.find('a')
	
	detailsPanel = soupData.find("table", { 'class':'track-panel-course'} )

	departureRow = detailsPanel.find('td', { 'class':'track-panel-departure' })
	departureAirportLoc = str(departureRow.find('span')['title'])
	departureAirport = (departureRow.find('a').string.split("&")[0])
	
	arrivalRow = detailsPanel.find('td', { 'class':'track-panel-arrival' })
	arrivalAirportLoc = str(arrivalRow.find('span')['title'])
	arrivalAirport = (arrivalRow.find('a').string.split("&")[0])
	
	if trackerUrl != None:
		nextFlight = trackerUrl['href']
		kill = False
	else:
		nextFlight = ""
		kill = True
		
	obj = {
		'flightId': flightId,
		'flightDate': flightDate,
		'source': departureAirportLoc,
		'destination': arrivalAirportLoc,
		'sport': departureAirport,
		'dport': arrivalAirport,
		'departLate': False,
		'arriveLate': False,
		'late': False,
		'cancelled': False,
		'influence': count,
		'notifications': [],
		'status': 'INIT'
	}
	
	results.append(obj)
	count += 1
	return grabFlights('http://flightaware.com' + nextFlight, results, breaker, count, kill)

dbCon = mongoConnect("localhost", 27017, "emu", "flights")
email = "brandon@9bplus.com"

baseUrl = sys.argv[1]
results = grabFlights(baseUrl)
focus = results[0]['flightId']
for flight in results:
	result = dbCon.find_one( { "flightId":flight['flightId'] }, { '_id':0 } )
	flight['focusFlight'] = focus
	flight['notify'] = email
	if result == None:
		dbCon.insert(flight)


