#!/bin/bash

cd ..
echo 'Build Start : '

x=1
src=''
des=''
cmd=''
while [ $x -le 3 ]
do
	echo '--------------------------------------------------'
	date

	input="/var/www/html/Flutter/vservice/build.list"
	y=0
	while IFS= read -r line
	do
		if [ $y -eq 0 ]
		then
			src=$line
		fi
		
		if [ $y -eq 1 ]
		then
			des=$line
		fi

		if [ $y -eq 2 ]
		then
			cmd=$line
		fi
		y=$(( $y + 1 ))
	done < "$input"
#--------------builder execute------------------------

	cd $src
	eval $cmd

#------------End builder execute----------------------
	x=$(( $x + 1 ))
	sleep 15
done


echo 'Build Stop!'


#if [ $1 -ge 18 ]
#then
	#echo You may go to the party.
#elif [ $2 == 'yes' ]
#then
	#echo You may go to the party but be back before midnight.
#else
	#echo You may not go to the party.
#fi