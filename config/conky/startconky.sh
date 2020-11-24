#!/usr/bin/env bash

CONKY_DIR=~/.config/conky

conky -c $CONK_DIR/conky.conf
conky -c $CONK_DIR/conky_weather.conf
conky -c $CONK_DIR/conky_TT.conf
conky -c $CONK_DIR/conky_system.conf
