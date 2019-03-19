#!/bin/bash
THIS_FILE=${0##*/}
CURRENT_PATH=$(pwd)
for tool in *.sh; do
    toolname=${tool%.sh}
    if [ ! -x $tool ]; then
        chmod +x $tool
    fi
    if [ $tool != $THIS_FILE ]; then
        if [ ! -x /usr/local/bin/$toolname ]; then
            OUTPUT=$(cp -s $CURRENT_PATH/$tool /usr/local/bin/$toolname 2>&1)
            RES=$(echo $?)
            if [ $RES == 0 ]; then
                echo "tool added to bin folder:              $toolname"
            elif [[ $OUTPUT =~ ".*Permission denied.*" ]]; then
                echo "tool could not be added to bin folder: $toolname (permission denied)"
            else 
                echo "tool could not be added to bin folder: $toolname"
            fi
        else 
                echo "tool already exists in bin folder:     $toolname"
        fi
    fi
done
