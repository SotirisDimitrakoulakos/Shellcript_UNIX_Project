#!/bin/bash
tameio1=5000
flag=0
n1=0
totaltime=0
while [ $totaltime -lt 300 -a $tameio1 -gt 0 -a $flag -ne 1 ]

do
  echo "Enter Time: "
  read time
  while [ $((time)) -le 0 ]
 
  do
    echo "Enter Valid Time: "
    read time
  done
  echo "Enter Value:"
  read poso
  if [ $((poso)) -lt 0 ]
    then
      posoneg=$((-1*poso))
      if [ $((posoneg)) -gt $((tameio1)) ]
         then
           flag=1
           poso2=$((posoneg-tameio1))
           echo "Not enough cash. $poso2 more euros needed to pay this request."
      fi
  fi
  if [ $((flag)) -ne 1 ]
     then
       tameio1=$(($tameio1+$poso))
  fi
  n1=$((n1+1))
  totaltime=$((totaltime+time))
done
echo "Customer Number: $n1"
echo "Total Time: $totaltime"
