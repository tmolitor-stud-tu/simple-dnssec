#!/usr/bin/env bash

if [ ! -d $BASEDIR ]; then
    echo "Basedirectory does not exist. Please install this application."
    exit 1
fi

sudo()
{
    if [ $UID -gt 0 ]; then
        /usr/bin/sudo $*
    else
        $*
    fi
}

command_exists()
{
    command="$1"
    message="$2"
    cmd=$(which "$command")

    if [ -z "$cmd" ]; then
        if [ -z "$message" ]; then
            echo "$command is not available. Please fix this."
        else
            echo $message
        fi
        exit 1
    fi
}


command_exists ods-ksmutil "Please install OpenDNSSEC"
command_exists python "Please install python"
command_exists sed "Please install sed"
command_exists dig "Please install dnsutil (provides command dig)"
