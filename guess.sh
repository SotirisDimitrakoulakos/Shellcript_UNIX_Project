#!/bin/bash

sum1=0
all1=()
sum2=0
all2=()
sum3=0
all3=()
sum4=0
all4=()
sum5=0
all5=()

read -p "Directory to Search (Type 'exit' to end the sequence): " dir1 
while [ "$dir1" != "exit" ] 
do

  echo -e "\n\n 1. \n"
  harr1=()
  for f1 in $(find $dir1 -perm $1 -type f);
  do
    harr1+=($f1)
  done
  filenum1=${#harr1[@]}
  echo -e "Number of Files: $filenum1 \n"
  for i in ${harr1[@]}; do echo $i; done
  sum1=`expr $sum1 + $filenum1`
  all1+=(${harr1[@]})

  echo -e "\n\n 2. \n"
  harr2=()
  for f2 in $(find $dir1 -mtime $2 -type f);
  do
    harr2+=($f2)
  done
  filenum2=${#harr2[@]}
  echo -e "Number of Files: $filenum2 \n"
  for i in ${harr2[@]}; do echo $i; done
  sum2=`expr $sum2 + $filenum2`
  all2+=(${harr2[@]})

  echo -e "\n\n 3. \n"
  harr3=()
  for f3 in $(find $dir1 -atime $2 -type d);
  do
    harr3+=($f3)
  done
  filenum3=${#harr3[@]}
  echo -e "Number of Directories: $filenum3 \n"
  for i in ${harr3[@]}; do echo $i; done
  sum3=`expr $sum3 + $filenum3`
  all3+=(${harr3[@]})

  echo -e "\n\n 4. \n"
  harr4=()
  for f4 in $(find $dir1 -type p,s);
  do
    harr4+=($f4)
  done
  filenum4=${#harr4[@]}
  echo -e "Number of Pipe and Socket Type Files: $filenum4 \n"
  for i in ${harr4[@]}; do echo $i; done
  sum4=`expr $sum4 + $filenum4`
  all4+=(${harr4[@]})

  echo -e "\n\n 5. \n"
  harr5=()
  for f5 in $(find $dir1 -maxdepth 1 -type f -empty);
  do
    harr5+=($f5)
  done
  filenum5=${#harr5[@]}
  echo -e "Number of Empty Files: $filenum5 \n"
  for i in ${harr5[@]}; do echo $i; done
  sum5=`expr $sum5 + $filenum5`
  all5+=(${harr5[@]})

  read -p "Directory to Search (Type 'exit' to end the sequence): " dir1
done

echo -e "\n\nHistory for 1. : \n\n"
echo -e "Total Number of Files: $sum1 \n"
echo -e "All Files:\n"
for el1 in ${all1[@]}; do echo $el1; done

echo -e "\n\nHistory for 2. : \n\n"
echo -e "Total Number of Files: $sum2 \n"
echo -e "All Files:\n"
for el2 in ${all2[@]}; do echo $el2; done

echo -e "\n\nHistory for 3. : \n\n"
echo -e "Total Number of Directories: $sum3 \n"
echo -e "All Directories:\n"
for el3 in ${all3[@]}; do echo $el3; done

echo -e "\n\nHistory for 4. : \n\n"
echo -e "Total Number of Pipe and Socket Type Files: $sum4 \n"
echo -e "All Files:\n"
for el4 in ${all4[@]}; do echo $el4; done

echo -e "\n\nHistory for 5. : \n\n"
echo -e "Total Number of Empty Files: $sum5 \n"
echo -e "All Files:\n"
for el5 in ${all5[@]}; do echo $el5; done

