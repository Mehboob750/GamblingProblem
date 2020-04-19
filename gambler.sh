#!/bin/bash -x
stake=100;
bet=1;

gamblerWin=1;
gamblerLose=0;
result=$((RANDOM%2));
if (( $result == $gamblerWin ))
then
	stake=$(($stake+$bet));
else
	stake=$(($stake-$bet));
fi
#echo "Gambler Stake : " $stake;
