#!/usr/bin/env bash

# Shows the price for desired cryptocurrencies. Module updates automatically
# every calendar day, but can also be updated with a middle click.

# Currencies should be ;-separated:
# human-readable name;urlname;icon
coins="Bitcoin;btc;
Ethereum;eth;ﲹ"
# LBC;lbc;📚"
# Basic Attention Token;bat;🦁

# Directory where currency info is stored.
dir="${XDG_DATA_HOME:-$HOME/.local/share}/crypto-prices"

getprices() { # The command to get the desired prices
	printf "🔃 "; printprices
	{ rm -rf "${dir:?}/*"
	echo "$coins" | while IFS=';' read -r human web icon; do
    val="$(curl -s "rate.sx/1$web")" &&v2=$(printf "%.0f" $val) &&
		echo "$icon;$v2;$human" > "$dir/$web"
	done; [ -d "$dir" ] && touch "$dir"
	pkill -RTMIN+13 "${STATUSBAR:-i3blocks}" ;} &
	exit
	}

printprices() { # Print/format all prices
	for x in "$dir"/*; do
		[ -f "$x" ] || break
		info="$(cut -d';' -f-2 --output-delimiter=' ' "$x")"
		printf "%s $ " "$info"
	done | sed 's/ $/\n/'
	}

[ ! -d "$dir" ] && mkdir -p "$dir" && { getprices; exit ;}

# If currencies haven't been updated today, try to update them.
[ "$(stat -c %x "$HOME/.local/share/crypto-prices" | cut -d' ' -f1)" != "$(date '+%Y-%m-%d')" ] && { ping -q -c 1 example.org >/dev/null 2>&1 && getprices || exit ;}

printprices
# "$@"
