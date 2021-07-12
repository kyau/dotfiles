#!/bin/bash

round()
{
echo $(printf %.$2f $(echo "scale=$2;(((10^$2)*$1)+0.5)/(10^$2)" | bc))
};

#raw=$(lscpu | grep "CPU MHz" | tr -s ' ' | cut -d ' ' -f 3)
raw=$(cat /proc/cpuinfo | grep "cpu MHz" | tr -s ' ' | cut -d ' ' -f 3)
IFS=$'\n' read -r -d '' -a raw < <( cat /proc/cpuinfo | grep "cpu MHz" | tr -s ' ' | cut -d ' ' -f 3 && printf '\0' )
sum=0
for r in "${raw[@]}"; do
    sum=$(echo "scale=2; $sum + $r" | bc)
done
val=$(echo "scale=2; $sum / ${#raw[@]}" | bc)
#rounded=$(round $raw/1000 2)
rounded=$(round $val/1000 2)
echo -e "${rounded}GHz"
