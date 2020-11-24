#!/usr/bin/env bash

CONKY_DIR=~/.config/conky
kill -9 $(pgrep conky)

conky -c $CONKY_DIR/conky.conf &2>/dev/null
conky -c $CONKY_DIR/conky_weather.conf &2>/dev/null
conky -c $CONKY_DIR/conky_TT.conf &2>/dev/null
conky -c $CONKY_DIR/conky_system.conf &2>/dev/null
