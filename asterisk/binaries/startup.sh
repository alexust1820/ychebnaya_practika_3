#!/bin/sh

echo 'Container is running...'

/usr/sbin/asterisk && echo 'Asterisk is ready.'
tail -f /dev/null
