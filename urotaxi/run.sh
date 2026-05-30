#!/bin/bash
N_ARGS=$#

if [ $N_ARGS -gt 0 ]; then
	exec $@
else
	$TOMCAT_HOME/bin/startup.sh
	tail -f /dev/null
fi


