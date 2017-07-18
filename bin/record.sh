#!/bin/bash

# Where to store the video
screencastDir='/mnt/archive/iNCOMING/'

show_help() {
	echo -e 'Usage: record.sh [OPTION]...'
	echo -e 'Initiate the recording of a screencast. Does nothing with no OPTION.\n'
	echo -e '    -f\t\t\trecord full screen'
	echo -e '    -s <#>\t\trecord a specific screen'
	echo -e '    -w\t\t\trecord a specific window'
	echo -e '    -z <dimensions>\trecord a specific size centered on screen'
	echo -e '    -d\t\t\tprint debug information and exit'
	echo -e '    -h\t\t\tdisplay this help and exit\n'
}

debug() {
	window_info
}

screen_info() {
	screen=$(xrandr | grep ' connected ' | cut -d' ' -f3 | awk 'NR=='$screenNum'{print;exit}')
	screenX=$(echo $screen | grep -oE '[0-9]+x[0-9]+' | cut -d'x' -f1)
	screenY=$(echo $screen | grep -oE '[0-9]+x[0-9]+' | cut -d'x' -f2)
	screenXX=$(echo $screen | grep -oE '\+[0-9]+\+[0-9]+' | cut -d'+' -f2)
	screenYY=$(echo $screen | grep -oE '\+[0-9]+\+[0-9]+' | cut -d'+' -f3)

	if [ $debug -eq 1 ] ; then
		echo -e 'Screen Width:'$screenX
		echo -e 'Screen Height:'$screenY
		echo -e 'Screen X:'$screenXX
		echo -e 'Screen Y:'$screenYY
	fi
}

window_info() {
	xwin=$(xwininfo)
	winX=$(echo $xwin | grep -oE 'Width:\s+[0-9]+' | grep -oE '[0-9]+')
	winY=$(echo $xwin | grep -oE 'Height:\s+[0-9]+' | grep -oE '[0-9]+')
	winXX=$(echo $xwin | grep -oE 'Absolute upper-left X:\s+[0-9]+' | grep -oE '[0-9]+')
	winYY=$(echo $xwin | grep -oE 'Absolute upper-left Y:\s+[0-9]+' | grep -oE '[0-9]+')

	if [ `expr $winX % 2` -eq 1 ] ; then
		winX=`expr $winX - 1`
	fi
	if [ `expr $winY % 2` -eq 1 ] ; then
		winY=`expr $winY - 1`
	fi
	
	if [ $debug -eq 1 ] ; then
		echo -e 'Window Width:\t'$winX
		echo -e 'Window Height:\t'$winY
		echo -e 'Window X:\t'$winXX
		echo -e 'Window Y:\t'$winYY
	fi
}

record_window() {
	window_info
	when=$(date +"%Y%m%d_%H%M")
	cmd='ffmpeg -f alsa -ac 2 -ar 96000 -i hw:0,0 -f x11grab -r 60 -s '$winX'x'$winY' -i :0.0+'$winXX','$winYY' -acodec pcm_s32le -vcodec libx264 -preset ultrafast -threads 0 '$screencastDir'screencast_'$winX'x'$winY'_'$when'.mkv'
	if [ $debug -eq 1 ] ; then
		echo -e $cmd
	else
		exec $cmd
	fi
}

record_size() {
	screen_info
	tsizeX=`echo $captureSize | cut -d'x' -f1`
	tsizeY=`echo $captureSize | cut -d'x' -f2`
	sizeX=`expr $screenX - $tsizeX`
	sizeY=`expr $screenY - $tsizeY`
	sizeX=`expr $sizeX / 2`
	sizeY=`expr $sizeY / 2`
	when=$(date +"%Y%m%d_%H%M")
#	record w/ audio
#	cmd='ffmpeg -f alsa -ac 2 -ar 96000 -i hw:0,0 -f x11grab -r 60 -s '$captureSize' -i :0.0+'$sizeX','$sizeY' -acodec pcm_s32le -vcodec libx264 -preset ultrafast -threads 0 '$screencastDir'screencast_'$captureSize'_'$when'.mkv'
	cmd='ffmpeg -f x11grab -r 60 -s '$captureSize' -i :0.0+'$sizeX','$sizeY' -vcodec libx264 -preset ultrafast -threads 0 '$screencastDir'screencast_'$captureSize'_'$when'.mkv'
	if [ $debug -eq 1 ] ; then
		echo -e 'Capture X: '$tsizeX
		echo -e 'Capture Y: '$tsizeY
		echo -e 'Capture XX: '$sizeX
		echo -e 'Capture YY: '$sizeY
		echo -e $cmd
	else
		exec $cmd
	fi
}

record_screen() {
	screen_info
	when=$(date +"%Y%m%d_%H%M")
#	cmd='ffmpeg -f alsa -ac 2 -ar 96000 -i hw:0,0 -f x11grab -r 60 -s '$screenX'x'$screenY' -i :0.0+'$screenXX','$screenYY' -acodec pcm_s32le -vcodec libx264 -preset ultrafast -threads 0 '$screencastDir'screencast_'$screenX'x'$screenY'_'$when'.mkv'
	cmd='ffmpeg -thread_queue_size 512 -probesize 100M -f pulse -i default -f x11grab -r 60 -s 1920x1080 -i :0.0+1680,0 -acodec pcm_s32le -vcodec libx264 -preset ultrafast -threads 0 -pix_fmt yuv420p '$screencastDir'screencast_1920x1080_'$when'.mkv'
	if [ $debug -eq 1 ] ; then
		echo -e $cmd
	else
		exec $cmd
	fi
}

# main()
debug=0
captureMode=none
screenNum=0
# check for arguments
if [ $# -eq 0 ] ; then
	show_help
	exit 1
fi
# parse arguments
while getopts dfhs:wz: opt
do
	case "$opt" in
		d)
			debug=1
			;;
		f)
			captureMode=full
			;;
		s)
			captureMode=screen
			screenNum=$OPTARG
			;;
		w)
			captureMode=window
			;;
		z)
			captureMode=size
			screenNum=1
			captureSize=$OPTARG
			;;
		h|\?)
			show_help
			exit 1
			;;
	esac
done
shift `expr $OPTIND - 1`

case "$captureMode" in
	full)
		exit 1
		;;
	screen)
		record_screen
		exit 1
		;;
	size)
		record_size
		exit 1
		;;
	window)
		record_window
		exit 1
		;;
esac
