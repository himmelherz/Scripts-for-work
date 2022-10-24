#!/bin/sh
i=0
prev_line=''
cat uptime_log.txt | grep "start time:" >> checking_uptime.txt
while read line
do



	if [ $i -eq 0 ];
	then
		prev_line=$line
		let "i += 1"
		
	
	else
			let "i -= 1"
			echo $prev_line
			echo $line
			if [ "$prev_line" != "$line" ];
			then
				echo "detected" >> checking_uptime.txt
			fi
	fi
		

done < checking_uptime.txt

exit 0
