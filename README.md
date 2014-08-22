EMU (Early Migration Updates)
===


![EMU Flight Tracker](http://i.imgur.com/N6vFnt1.jpg)

Using flightaware.com data, EMU will find your flight based on the supplied information and construct a "flight chain". This flight chain is based off the aircraft that will ultimately be used to get you from point A to point B. By tracking flights that are part of your chain, it's possible to identify if your flight might have issues 1-2 flights before your own.

Requirements
------------
    pip install -r requirements.txt --no-index --find-links file:///tmp/packages

Components
----------
### emu.py
The emu script is the main brain of the operation. This script should be added to a crontab file (polling every 5 minutes). 

### findFlights.py
Due to flight numbers being used, it's not possible to use just that to locate a specific flight. This script will attempt to find the user's specified flight using the FlightAware API and then construct a flight chain for EMU to monitor.

### www
These are the primary components for a web interface. 
