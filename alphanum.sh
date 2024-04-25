#!/bin/bash

first=$(grep -n "^$2" $1 | { grep -v grep || true; })

second=$(grep -n "$2" $1)

third=$(grep -n "$2$" $1 | { grep -v grep || true; })

firstnum=$(echo "$first" | wc -l)

secondnum=$(echo "$second" | wc -l)

thirdnum=$(echo "$third" | wc -l)

echo -e "\nBeginning of Line:\n\n\n$first\n\nNumber of Lines: $firstnum"

echo -e "\n\n\n\nIn Line:\n\n\n$second\n\nNumber of Lines: $secondnum"

echo -e "\n\n\n\nEnd of Line:\n\n\n$third\n\nNumber of Lines: $thirdnum\n"
