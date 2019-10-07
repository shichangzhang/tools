#!/bin/bash

NOTES=~/.n/notes
TIME=`printf "[%(%Y/%m/%d %r)T]"`
case "$1" in
    p)
        less +G $NOTES
        ;;

    c)
        rm -i $NOTES
        touch $NOTES
        ;;

    e)
        vim + $NOTES
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
