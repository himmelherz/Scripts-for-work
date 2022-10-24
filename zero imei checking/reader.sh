#!/bin/sh

while read line
do
	echo $line >> log of dhcp
done < /tmp/dhcp_notify.txt


exit 0
