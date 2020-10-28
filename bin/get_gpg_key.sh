#!/usr/bin/env bash

verify_keyring()
{
    if ! gpg --keyserver pgp.mit.edu --recv-keys $1 > /dev/null 2>&1
    then
        if ! gpg --keyserver hkp://pool.sks-keyservers.net  --recv-keys $1 > /dev/null 2>&1
        then
            err "could not verify the key. Please check: https://blackarch.org/faq.html"
        fi
    fi
}

verify_keyring $1

