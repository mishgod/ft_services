#!/bin/sh

echo -en "\033[31mnginx is starting\n\033[0m"

/usr/bin/supervisord -c /etc/supervisord.conf