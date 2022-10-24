#!/bin/sh
i=0
ac=0
read i<i.txt

rm -rf /opt/acquisition/data

sleep 60
	let "i += 1"
	
	echo "iteration = $i" >> memory_counter_log.txt 
	date >> memory_counter_log.txt
	echo "***" >> memory_counter_log.txt

	echo "iteration = $i" >> df_log.txt 
	date >> df_log.txt 
	df -h >> df_log.txt
	echo "***" >> df_log.txt 




	echo "iteration = $i" >> dev_log.txt
	ls /dev/ >> dev_log.txt
	echo "***" >> dev_log.txt
	 
	echo "iteration = $i" >> uptime_log.txt
	pgrep acquisition >> ac.txt
	date >> uptime_log.txt
	read ac < ac.txt
	awk '{print "CPU time: " $14+$15; print "start time: " $22}' /proc/$ac/stat >> uptime_log.txt
	echo "***" >> uptime_log.txt
	rm ac.txt
	
	sleep 300



	if test -f "/opt/acquisition/data/0/1.json"; 
	then

				
				echo "Successful start" >> memory_counter_log.txt 
				echo "iteration = $i" >> memory_counter_log.txt  
				echo "***" >> memory_counter_log.txt
							
	fi

	echo "end of cycle" >> memory_counter_log.txt 
	date >> memory_counter_log.txt
	echo "***" >> memory_counter_log.txt



	echo "end of cycle">> dev_log.txt
	ls /dev/ >> dev_log.txt
	echo "***" >> dev_log.txt
	 
	
	echo "end of cycle" >> df_log.txt 
	date >> df_log.txt 
	df -h >> df_log.txt
	echo "***" >> df_log.txt 


	echo "end of cycle" >> uptime_log.txt
	pgrep acquisition >> ac.txt
	read ac < ac.txt
	date >> uptime_log.txt
	awk '{print "CPU time: " $14+$15; print "start time: " $22}' /proc/$ac/stat >> uptime_log.txt
	echo "***" >> uptime_log.txt
	rm ac.txt
rm i.txt
echo $i >> i.txt
	reboot now

exit 0




