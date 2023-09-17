#! /bin/bash
guess=$(($RANDOM %10))

attempts=20
for(( i=0;i<$attempts;i++ )) 
do 
echo "Guess a number between 0 and 10 ,including 0 and 10"
read input
	
if [ $input -lt  $guess  ]; then
echo "Too small"
 
elif [ $input -gt $guess ]; then
echo "Too big"

elif [ $input -eq $guess ]; then
echo "********************"
echo "Congratulations Correct guess"
echo "********************"
exit
fi
done 

if [ $input != $guess ]
then

echo "********************"
echo "Sorry The correct number was $guess"
echo "********************"

fi
