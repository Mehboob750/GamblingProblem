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


   stake=$todaysStake;
done
echo "Total amount after 20 days are: " $stake;
