#!/bin/bash

round()
{
echo $(printf %.$2f $(echo "scale=$2;(((10^$2)*$1)+0.5)/(10^$2)" | bc))
};

raw=$(lscpu | grep "CPU MHz" | tr -s ' ' | cut -d ' ' -f 3)
rounded=$(round $raw/1000 2)
echo -e "${rounded}GHz"