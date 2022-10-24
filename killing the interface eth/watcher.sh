#!/bin/sh
	ifconfig eth0.1 down
	ps | grep "dhcp" >> dhcp_grep.txt
	ps | grep "default" >> "default_grep.txt"
	ps >> "ps_log.txt"
	echo "***" >> dhcp_grep.txt
	echo "***" >> default_grep.txt
	echo "***" >> ps_log.txt
	sleep 150

	ifconfig eth0.1 down
	ps | grep "dhcp" >> dhcp_grep.txt
	ps | grep "default" >> "default_grep.txt"
	ps >> "ps_log.txt"
	echo "***" >> dhcp_grep.txt
	echo "***" >> default_grep.txt
	echo "***" >> ps_log.txt



exit 0
