#!/bin/bash -x
numberOfDays=20;
bet=1;
gamblerWin=1;
gamblerLose=0;
declare -A winForTheDay;
declare -A loseForTheDay;
iteration1=0;
iteration2=0;
while [ true ]
do

	stake=0;
	stakePerDay=100;
	for(( iteration=1; iteration<=numberOfDays; iteration++ ))
	do
   		stake=$(($stake+$stakePerDay));
   		winingStake=$(( $stake + ($stake/2) ));
   		loseingStake=$(( $stake - ($stake/2) ));
   		while [ true ]
   		do
      		if (( $todaysStake==$winingStake || $todaysStake==$loseingStake ))
      		then
         		break;
      		fi

      		result=$((RANDOM%2));

      		if (( $result == $gamblerWin ))
      		then
         		todaysStake=$(($todaysStake+$bet));
      		else
         		todaysStake=$(($todaysStake-$bet));
     		fi
   		done

   		if (( $stake < $todaysStake ))
   		then
      		winForTheDay[Day-"$iteration"]=$(($todaysStake-$stake));
   		else
      		loseForTheDay[Day-"$iteration"]=$(($stake-$todaysStake));
   		fi

   		stake=$todaysStake;
   		#sleep 5s;
   		#everyDayResult[((iteration))]="$stake";
   		#sleep 5s;
	done
	echo "Gambler Total Stake After 20 days : " $stake;
	#echo ${everyDayResult[@]};
	echo "Win for the days: " ${winForTheDay[@]};
	echo ${!winForTheDay[@]};

	echo "Lose for the days: " ${loseForTheDay[@]};
	echo ${!loseForTheDay[@]};

	resultMonth[((Counter1++))]="$stake";
	echo ${resultMonth[@]};
	read -p "Enter 1 for play for next month/ Enter 0 to stop : " choice;
	if (( $choice == 0 ))
	then
			break;
	fi

done
