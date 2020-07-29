#!/usr/bin/env sh
if [[ ! $# -eq 0 ]];then
    Pipfile=$1
else
    Pipfile=Pipfile
fi
awk -F= -e '{print $1}' $Pipfile| sed -e "s/\[.*$//g;s/^python_version $//g;s/^url $//g;s/^name $//g;s/^verify_ssl $//g;/^$/d" > requirements.txt;

exit 0
