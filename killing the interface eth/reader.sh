#!/bin/sh
while true
do
	tail -f /tmp/dhcp_notify.txt >> log_of_dhcp.txt
done

exit 0
