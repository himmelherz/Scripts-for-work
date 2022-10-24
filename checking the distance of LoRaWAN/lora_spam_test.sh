#!/bin/sh
i=0
ac=0
aprev=0
touch /root/ac.txt
touch /root/aprev.txt
touch /root/prev_History_Status.json
touch /root/new_History_Status.json

chmod 777 /root/new_History_Status.json
cat /opt/acquisition/data/History_Status.json | grep "last_rid" >> /root/ac.txt
cat /root/prev_History_Status.json | grep "last_rid" >> /root/aprev.txt
read ac</root/ac.txt
read aprev</root/aprev.txt
echo $ac | tr -cd "0-9." >> /root/i
echo $i >> /root/script_log.txt
read i</root/i
let i=i-3000
echo $i >> /root/script_log.txt

cat /opt/acquisition/data/History_Status.json | grep "send_rid_1" >> /root/send
read send</root/send
need_to_send='"send_rid_1":'$i','
echo $send
rm /root/prev_History_Status.json
touch /root/prev_History_Status.json
cat /opt/acquisition/data/History_Status.json >> /root/prev_History_Status.json




sed  "s/$send/$need_to_send/" /root/prev_History_Status.json >> /root/new_History_Status.json

cat /root/new_History_Status.json >> /root/script_log.txt
rm /root/ac.txt
rm /root/aprev.txt
rm /opt/acquisition/data/History_Status.json
rm /opt/acquisition/data/History_Status.json.bk
cp -p /root/new_History_Status.json /opt/acquisition/data/History_Status.json
chmod 777 /opt/acquisition/data/History_Status.json
rm /root/new_History_Status.json
rm /root/i
rm /root/send
exit 0


