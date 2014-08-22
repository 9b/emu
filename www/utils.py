import pymongo
from pymongo import Connection
import random, string

def mongoConnect(host, port, database, collection):
    connection = Connection(host, port)
    db = connection[database]
    collection = db[collection]
    return collection