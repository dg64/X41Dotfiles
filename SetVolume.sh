#!/bin/bash

###############################################################################
# SCRIPT NAME:	SetVolume.sh
# DESCRIPTION:  Wrapper script to be used in xbindkeysrc.scm to handle volume
#               and volume's notification
# ARGS:         lower|raise|mute
# AUTHOR:	Domenico Galizia
# EMAIL:	dgalizia@yandex.ru
###############################################################################


arg="$1"

function ShowUsage() {
	echo "Usage: SetVolume raise|lower|mute"
	echo "Notes: Put this script in /usr/local/bin"
	echo "Modify the file .xbindkeysrc.scm as follow: "
	echo "(xbindkey '(\"XF86AudioMute\") \"SetVolume mute\")"
	echo "(xbindkey '(\"XF86AudioRaiseVolume\") \"SetVolume raise\")"
	echo "(xbindkey '(\"XF86AudioLowerVolume\") \"SetVolume lower\")"
}

case $arg in 
	raise)
		pactl set-sink-mute 0 false;
		pactl set-sink-volume 0 +5%
#		volnoti-show $(amixer get Master | grep -Po "[0-9]+(?=%)" | tail -1)
		;;
	lower)
		pactl set-sink-mute 0 false;
		pactl set-sink-volume 0 -5%
#		volnoti-show $(amixer get Master | grep -Po "[0-9]+(?=%)" | tail -1)
		;;
	mute)
		pactl set-sink-mute 0 toggle
		ismute=$(amixer get Master | grep -F "[off]" | wc -l)
#		if [[ $ismute == 1 ]]; then
#			volnoti-show -m
#		else
#			volnoti-show $(amixer get Master | grep -Po "[0-9]+(?=%)" | tail -1)
#		fi
		;;
	*)
		ShowUsage
		;;
esac

