#!/bin/bash

set -e

if [ -z "$1" ]; then
	echo 'ERROR: first param need to be domain'
	exit 5
fi

if [ -z "$2" ]; then
	echo 'ERROR: scound param need to be number'
	exit 5
fi

filename="$2-$1.conf"
filefullpath="/home/ubuntu/apache/sites-available/$filename"
templatename='template.conf'

if [ "$3" == "ssl" ]; then
	templatename='template-ssl.conf'
fi

cp $templatename $filefullpath

sed -i 's/{{domain}}/'$1'/' $filefullpath

if [ "$3" != "ssl" ]; then
	mkdir "/var/lok/$1"
	mkdir "/var/lok/$1/public_html"
	mkdir "/var/lok/$1/apache_logs"

	chown -hR ubuntu:ubuntu /var/lok/$1

	ln -s $filefullpath "/home/ubuntu/apache/sites-enabled/$filename"
fi

echo 'Done!'
