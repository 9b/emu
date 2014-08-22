import re
import sys
import datetime
from operator import itemgetter
import simplejson as json
from bottle import route, view, run, static_file, request, abort, get, post, redirect, app
from beaker.middleware import SessionMiddleware
import pytz

from auth import requireLogin
from utils import mongoConnect

@route('/processFlight', method='POST')
@requireLogin
def registerFlight():
	session = request.environ.get('beaker.session')
	username = session['username']
	
	tailId = request.json['tailId']
	flightDate = datetime.datetime.strptime(request.json['departure'], "%m/%d/%Y %I:%M %p")
	departTz = pytz.timezone(request.json['timezone'])
	
	localized = departTz.localize(flightDate)
	normalized = localized.astimezone(pytz.utc)
	
	obj = {
		'tailId': tailId,
		'departureTime': normalized,
		'departureStr':flightDate.strftime('%Y-%m-%d %H:%M'),
		'departureDay':normalized.strftime('%Y-%m-%d'),
		'status': 'INIT',
		'searchCount': 0,
		'user': username
	}
	emuDb = mongoConnect("localhost", 27017, "emu", "accounts")
	result = emuDb.find_one( {'username':username}, {'_id':0})
	result['flights'].append(obj)
	emuDb.update({'username':username}, { "$set": {'flights': result['flights'], 'lastActive': datetime.datetime.now() } })
	
	preflight = mongoConnect("localhost", 27017, "emu", "preflights")
	preflight.insert(obj)
	
	return { 'success': True }
	
@route('/flights', method='GET')
@requireLogin
@view('flights')
def showFlights():
	session = request.environ.get('beaker.session')
	username = session['username']
	
	flights = []
	emuDb = mongoConnect("localhost", 27017, "emu", "accounts")
	result = emuDb.find_one( {'username':username}, {'_id':0})
	for flight in result['flights']:
		if  flight['departureTime'] > datetime.datetime.now():
			flights.append(flight)
		
	flights.sort(key=lambda x: x['departureStr'])
	return { 'flights':flights }
