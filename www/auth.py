import re
import sys
import datetime
from operator import itemgetter
import simplejson as json
from bottle import route, view, run, static_file, request, abort, get, post, redirect
from beaker.middleware import SessionMiddleware
import logging
import hashlib

from utils import *

def getUsername():
	session = request.environ.get('beaker.session')
	if "username" in session:
		return session['username']
	else:
		return None

def requireLogin(func):
	def wrapper(*args, **kwargs):
		username = getUsername()
		if username == None:
			redirect("/login")
		else:
			return func(*args, **kwargs)
	return wrapper

@route('/login', method="GET")
@view('login')
def loadForm():
	return {}

@route('/validate', method="POST")
def handle_login():
	username = request.json['username']
	password = request.json['password']

	userDb = mongoConnect("localhost", 27017, "emu", "accounts")
	result = userDb.find_one({"username": username})
	pHash = hashlib.sha256(password).hexdigest()
	if pHash == result['password']:
		s = request.environ.get('beaker.session')
		s['logged_in'] = True
		s['username'] = username
		s['session.cookie_expires'] = 60*60*24*30
		s.save()
	
		userDb.update({"username": username}, { "$set": {'lastActive': datetime.datetime.now()} })
		return { 'success': True }
	else:
		return { 'success': False }

@route('/processSignup', method="POST")
def signupUser():
	invite = request.json['invite']
	username = request.json['username']
	password = request.json['password']
	
	inviteDb = mongoConnect("localhost", 27017, "emu", "invites")
	result = inviteDb.find_one({'invite':invite})
	if result != None and result['valid']:
		userDb = mongoConnect("localhost", 27017, "emu", "accounts")
		
		obj = {
			'username': username,
			'password': hashlib.sha256(password).hexdigest(),
			'firstActive': datetime.datetime.now(),
			'lastActive': datetime.datetime.now(),
			'flights': [],
		}
		
		userDb.insert(obj)
		
		s = request.environ.get('beaker.session')
		s['logged_in'] = True
		s['username'] = username
		s['session.cookie_expires'] = 60*60*24*30
		s.save()
		
		inviteDb.update({'invite':invite}, { "$set": {'valid': False}})
		
		return { 'success': True }
	else:
		return { 'success': False, 'error':'invite code is invalid' }
	

