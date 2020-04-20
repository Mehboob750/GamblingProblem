#!/bin/bash -x
numberOfDays=20;
stake=0;
everyDayStake=100;
bet=1;
gamblerWin=1;
gamblerLose=0;
declare -A winForTheDay;
declare -A loseForTheDay;
iteration1=0;
iteration2=0;

for(( iteration=1; iteration<=numberOfDays; iteration++ ))
do
   stake=$(($stake+$everyDayStake));
   winingStake=$(($stake+($stake/2)));
   loseingStake=$(($stake-($stake/2)));
   while [ true ]
   do
      if (( $todaysStake==$winingStake || $todaysStake==$loseingStake ))
      then
         break;
      fi

      playBet=$((RANDOM%2));

      if (( $playBet == $gamblerWin ))
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
#echo "Gambler Stake : " $stake;
#echo ${everyDayResult[@]};
echo "Win for the days: " ${winForTheDay[@]};
echo ${!winForTheDay[@]};

echo "Lose for the days: " ${loseForTheDay[@]};
echo ${!loseForTheDay[@]};
echo "Total amount after 2o days are: " $stake;
