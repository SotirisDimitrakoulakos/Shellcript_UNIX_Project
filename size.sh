#!/bin/bash

if [ $1 -le 0 -o $1 -gt 14 ]
then
  echo -e "Invalid Input!\n"
else
  flag=0
  files2=()
  files0=$(ls)
  files1=(${files0// / })
  for i in "${files1[@]}"
  do
    birth=$(stat -c '%w' $i)
    split1=(${birth// / })
    time=${split1[1]}
    split2=(${time//:/ })
    hour=${split2[0]}
    if (( hour == $1 ))
    then
      flag=1
      files2+=($i)
    fi
  done
  if [ $flag -eq 0 ]
  then
    echo -e "No files created at this hour.\n"
    exit
  fi
  mkdir timefile
  for j in "${files2[@]}"; do mv $j timefile; done
fi
