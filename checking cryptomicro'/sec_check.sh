#!/bin/sh
i=0
rm /mnt/usb/log/acquisition.log
while true
do
	let "i += 1"	
	acstop
	echo "stop acquisition" 
	sleep 40
	acstart
	echo "start acquisition" 
	sleep 60
	cat /mnt/usb/log/acquisition.log | grep  "Security check failure" >> script_out.txt
	while read LINE
    	do 
			if  [ -n "$LINE" ]
			then
				echo "THERE ARE errors of security" 
				echo "Security check failure" >> script_out_finish.txt 
				echo "iteration = $i" >> script_out_finish.txt  
				echo "***" >> script_out_finish.txt 
				exit 0				
			fi
	
	done < script_out.txt
	echo "no errors of security" 
	echo "no failure" >>  script_out_finish.txt 
	echo "iteration = $i" >> script_out_finish.txt 	
	echo "***" >> script_out_finish.txt 

done <  script_out_finish.txt 


exit 0
