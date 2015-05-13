#!/bin/sh

### VARIABLES
## TODO: MOVE THESE CONFIG PARAMETERS TO UCI
CONF_SERVER="tunnelr3.hopbox.in"
CONF_SERVER_PORT="5901"
CONF_URL="http://$CONF_SERVER:$CONF_SERVER_PORT/config/devices"
TMP_CONF="/tmp/latest.conf"

## Get the device ID
MAC=`/sbin/ifconfig eth0 | grep HWaddr | awk '{print $5}' | sed -e 's/\://g'`
DEV_ID="HB$MAC"

## Query the config server for the config
curl -sf -o $TMP_CONF "$CONF_URL/$DEV_ID"
FETCH_RESULT=$?
echo "CURL RETURNED $FETCH_RESULT"

if [ "$FETCH_RESULT" -ne 0 ]
    then
        echo "There was a problem fetching the config. Exiting."
        exit 1
    else
        echo "The config was saved. Proceeding."
### If result is false, log and exit
### If result is NOT false, save the config in /tmp
#### Call getsetconf.pl with path to saved config
### On success, update the config version with UCI, issue "sync" 
## Call back the same URL with POST and the current config version
fi
