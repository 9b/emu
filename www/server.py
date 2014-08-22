import re
import sys
import datetime
from operator import itemgetter
import simplejson as json
from bottle import route, view, run, static_file, request, abort, get, post, redirect, app
from beaker.middleware import SessionMiddleware

from auth import requireLogin
from utils import mongoConnect

from auth import *
from flight import *

files_dir = sys.argv[2]

@route('/static/<filepath:path>')
def server_static(filepath):
	return static_file(filepath, root=files_dir)

@route('/', method='GET')
@requireLogin
@view('register')
def default():
	return {}
	
@route('/register', method='GET')
@requireLogin
@view('register')
def showRegister():
	return {}
	
@route('/signup', method='GET')
@view('signup')
def showSignup():
	return {}

@route('/account', method='GET')
@requireLogin
@view('account')
def showAccount():
	session = request.environ.get('beaker.session')
	username = session['username']
	
	emuDb = mongoConnect("localhost", 27017, "emu", "accounts")
	result = emuDb.find_one( {'username':username}, {'_id':0})
	
	obj = {
		'username': result['username'],
		'firstActive': result['firstActive'].strftime('%Y-%m-%d %H:%M'),
		'lastActive': result['lastActive'].strftime('%Y-%m-%d %H:%M')
	}
	
	return { 'account': obj }

session_opts = {
    'session.type': 'file',
    'session.cookie_expires': 60*60*24*30,
    'session.data_dir': './data',
    'session.auto': True,
    'session.secret':'ZnJU_XgGQR_r1MccHI_aRqFu-8hj6Nmnednt-dkFbGgOSTiwMmiRlcXTjnzQHzk5U_c='
}

localApp = SessionMiddleware(app(), session_opts)
run(app=localApp, host='0.0.0.0', port=sys.argv[1], debug=True)
