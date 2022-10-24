#!/bin/sh
i=0
a=0
b=0
SUB="\"event_type\": 1"
SUB2="\"event_type\": 3"
min_check=0
while :
do
	min_check=$(date +%M)

if [ $min_check -eq 5 ] || [ $min_check -eq 15 ] || [ $min_check -eq 25 ] || [ $min_check -eq 35 ] || [ $min_check -eq 45 ] || [ $min_check -eq 55 ];
then

{
touch b.txt
	let "i += 1"
	
	echo "iteration = $i" >> 343_check_log.txt 
	date >> 343_check_log.txt 
	


	cat *.json | grep "\"event_code\": 343" -r data -B 3 >> b.txt
	


while read line
do
case $line in

  *"$SUB"*)
  let "a += 1"
    ;;
esac		

case $line in

  *"$SUB2"*)
    let "a -= 1"
    ;;
esac	
done < b.txt
	
echo "Koef a=$a"

	if [ $a -eq 0 ];
	then
		echo "It's OK on 485" >> 343_check_log.txt 
	else
		echo "Problems on 485!" >> 343_check_log.txt

	fi

echo "***" >> 343_check_log.txt

rm b.txt
a=0
sleep 60
}
fi
sleep 10
done

	

exit 0




