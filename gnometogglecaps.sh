#! /bin/bash

GSETTINGS=/usr/bin/gsettings
SCHEMA=org.gnome.desktop.input-sources
KEY=xkb-options
VALUE=$($GSETTINGS get $SCHEMA $KEY)

if [ "$VALUE" == "@as []" ]
then
    VALUE="['caps:escape']"
elif [[ "$VALUE" == *"'caps:escape'"* ]]
then
    VALUE=${VALUE//"'caps:escape',"}
    VALUE=${VALUE//", 'caps:escape'"}
    VALUE=${VALUE//"'caps:escape'"}
else
    VALUE="${VALUE//"]"}, 'caps:escape']"
fi

eval "$GSETTINGS set $SCHEMA $KEY \"$VALUE\""
