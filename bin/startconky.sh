#!/usr/bin/env bash

CONKY_DIR=~/.config/conky

conky -c $CONK_DIR/conky.conf >/dev/null
conky -c $CONK_DIR/conky_weather.conf >/dev/null
conky -c $CONK_DIR/conky_TT.conf >/dev/null
conky -c $CONK_DIR/conky_system.conf >/dev/null
