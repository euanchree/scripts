#!/bin/bash

CURRENT_WORKSPACE=$(wmctrl -d | grep "*" | cut -b 1)
WORKSPACE_COUNT=$(wmctrl -d | wc -l)
TARGET_WORKSPACE=$CURRENT_WORKSPACE

if [[ $1 == "next" ]]; then
	if [[ $CURRENT_WORKSPACE == $(expr $WORKSPACE_COUNT - 1) ]]; then
		TARGET_WORKSPACE=0
	else
		TARGET_WORKSPACE=$(expr $CURRENT_WORKSPACE + 1)
	fi
elif [[ $1 == "prev" ]]; then
	if [[ $CURRENT_WORKSPACE == "0" ]]; then
		TARGET_WORKSPACE=$(expr $WORKSPACE_COUNT - 1)
	else
		TARGET_WORKSPACE=$(expr $CURRENT_WORKSPACE - 1)
	fi
fi

wmctrl -s $TARGET_WORKSPACE
