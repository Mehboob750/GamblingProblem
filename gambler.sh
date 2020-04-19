#!/bin/bash -x
stake=100;
bet=1;
gamblerWin=1;
gamblerLose=0;

winingStake=$(($stake+($stake/2)));
loseingStake=$(($stake-($stake/2)));

while [ true ]
do
	if (( $stake==$winingStake || $stake==$loseingStake ))
	then
		break;
	fi
	result=$((RANDOM%2));
	if (( $result == $gamblerWin ))
	then
		stake=$(($stake+$bet));
	else
		stake=$(($stake-$bet));
	fi
done
#echo "Gambler Stake : " $stake;
