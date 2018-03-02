#!/bin/bash

# This script can be scheduled via cron to kill existing openconnect VPN sessions

# Broadcast warning to users that active VPN sessions will be killed in 10 minutes
COUNTER=10
while [ $COUNTER -gt 0 ]; do
	/usr/local/bin/notify-send-all.sh "Killing VPN Sessions in $COUNTER Minutes" \
		"Use \"sudo killall /usr/local/bin/kill-openconnect.sh\" to cancel."
	sleep 2
	let COUNTER=COUNTER-2
done

# If timer expires without being cancelled, kill VPN connections
/usr/bin/killall openconnect
