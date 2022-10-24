#!/bin/sh
while true
do
	acstop
	sleep 40
	acstart
	sleep 300
	chmod 777 /opt/acquisition/script_out.txt
	cat *.json | grep -r '"imei": 0,' /opt/acquisition/data >> /opt/acquisition/script_out.txt

	
	while read LINE
    	do 
			if  [ -n "$LINE" ];
			then
				echo "zero imei"
				exit 0
			fi

	done < /opt/acquisition/script_out.txt

	echo "no zero imei at that iteration"
	sleep 10
	done < /opt/acquisition/script_out.txt


exit 0
