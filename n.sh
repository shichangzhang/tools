#!/bin/bash

NOTES=~/notes
TIME=`printf "[%(%Y/%m/%d %r)T]"`
case "$1" in
    p)
        cat $NOTES
        ;;

    c)
        rm $NOTES
        touch $NOTES
        ;;

    t)
        if [ -z $2 ]; then
            tail -1 $NOTES
        else
            tail -$2 $NOTES
        fi
        ;;

    *)
        read note
        printf "$TIME %s\n" "$note" >> $NOTES
        ;;
esac
