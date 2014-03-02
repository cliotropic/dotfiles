#!/usr/bin/env bash

## TO DO: This doesn't DTRT anywhere but cliotrope because of the logpath duplication step.
##        For now, it's best to ssh in and run remotely, then load via Dropbox.

LOGPATH=~/DISS/daily_logs
DAILYLOG=`date "+dailylog_%Y-%m-%d.md"`
LOGFILE=$LOGPATH/$DAILYLOG

SHAREPATH=~/Dropbox/shane
SHAREDFILE=$SHAREPATH/$DAILYLOG

mkdl () {
	# make a daily log file. Keep it on Dropbox, with a hard link to the other
	# logs directory.
	if ! [ -e $SHAREDFILE ]	
	then
		~/bin/makelog.py > $SHAREDFILE
		if ! [ -e $LOGFILE ]	
		then
			ln $SHAREDFILE $LOGFILE
			# don't think we actually need this
			# ln -s $LOGFILE $LOGFILE.txt
		fi
	fi
}

rmdl () {
	# make a daily log file. Keep it on Dropbox, with a hard link to the other
	# logs directory.
	if [ -e $SHAREDFILE ]	
	then
		rm -iv $SHAREDFILE
		rm -iv $LOGFILE
	fi
}

edl () {
	# edit the daily log file; create it if it doesn't exist.
	if ! [ -e $SHAREDFILE ]	
	then
		mkdl
	fi
	edit $SHAREDFILE

}

case $1 in 
	mk)
		mkdl
		;;
	ed)
		edl
		;;
	rm)
		rmdl
		;;
	*)
		echo "Accepted args are mk, ed, rm"
		exit
		;;
esac
	

mkdl
