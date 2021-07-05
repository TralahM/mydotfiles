#!/usr/bin/env bash


coins="USD;KES
USD;KES
GBP;KES
EUR;KES"
# Directory where currency info is stored.
dir="${XDG_DATA_HOME:-$HOME/.local/share}/currency_exchange_rates"
Akey="1a09efb5f6fe4ec6b5f3"


# currency1=`echo -n $1 | tr '[:lower:]' '[:upper:]'`
# currency2=`echo -n $2 | tr '[:lower:]' '[:upper:]'`
# sym1=$(jq ".${currency1}.symbol" ~/bin/currencies.json)
# sym2=$(jq ".${currency2}.symbol" ~/bin/currencies.json)

getprices() { # The command to get the desired prices
	printf "🔃 "; printprices
	{ rm -rf "${dir:?}/*"
	echo "$coins" | while IFS=';' read -r currency1 currency2; do
        val="$(curl -s "https://free.currconv.com/api/v7/convert?q=${currency1}_${currency2}&compact=ultra&apiKey=${Akey}" | jq ".${currency1}_${currency2}")" &&
            v2=$(printf "%.0f" $val) &&
            sym1=$(jq ".${currency1}.symbol" ~/data/currencies.json)&&
                sym2=$(jq ".${currency2}.symbol" ~/data/currencies.json)&&
                echo "$sym1;$v2;$sym2"|sed 's/\"//g' > "$dir/${currency1}_${currency2}"
	done; [ -d "$dir" ] && touch "$dir"
	pkill -RTMIN+13 "${STATUSBAR:-i3blocks}" ;} &
	exit
	}

printprices() { # Print/format all prices
	for x in "$dir"/*; do
		[ -f "$x" ] || break
		info="$(cut -d';' -f-3 --output-delimiter=' ' "$x")"
		printf "%s " "$info"|sed 's/Ksh/Sh/g;s/\([[:digit:]]\{1,10\}.[[:digit:]]\{1,2\}\).*/\1 /g'
	done | sed 's/ $/\n/;s/"//g;s/ //g'
	}

[ "$(stat -c %x "$HOME/.local/share/currency_exchange_rates" | cut -d' ' -f1)" != "$(date '+%Y-%m-%d')" ] && { getprices || exit ; }

printprices

# vim: ft=sh
