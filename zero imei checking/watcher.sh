#!/bin/sh

'acstop'
echo "stopping the acquisition"
sleep 40
echo "start to clean"
echo "" > /opt/acquisition/config.json
echo "" > /opt/acquisition/config.json.bk

while read line
do
	echo $line >> /opt/acquisition/config.json
	echo $line >> /opt/acquisition/config.json.bk
done < config_without_meter.txt
echo "}" >> /opt/acquisition/config.json
echo "}" >> /opt/acquisition/config.json.bk
sleep 40
'acstart'
sleep 150


'acstop'
echo "stopping the acquisition"
sleep 40
echo "start to spam"
echo "" > /opt/acquisition/config.json
echo "" > /opt/acquisition/config.json.bk
while read line
do
	echo $line >> /opt/acquisition/config.json
	echo $line >> /opt/acquisition/config.json.bk
done < config_with_meter.txt
echo "}" >> /opt/acquisition/config.json
echo "}" >> /opt/acquisition/config.json.bk
sleep 40
'acstart'
sleep 900


exit 0
