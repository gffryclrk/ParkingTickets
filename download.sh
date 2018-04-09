#!/bin/bash
# download some files
# bash is confusing...
# 
# relevant: https://www.cyberciti.biz/faq/bash-concatenating-variables-with-string/
# https://stackoverflow.com/questions/8880603/loop-through-an-array-of-strings-in-bash

url="http://opendata.toronto.ca/revenue/parking/ticket/"
declare -a years=("2008" "2009" "2010" "2011" "2012" "2013" "2014" "2015" "2016" "2017" "2018")
yearslength=${#years[@]}

for (( i=0; i<${yearslength}; i++));
do
	file="parking_tickets_"${years[$i]}".zip"
	# echo ${file}	
	#echo ${url}${years[$i]}".zip"
	# wget ${url}${years[$i]}".zip"
	wget ${url}${file}
	unzip ${file}
done

# for a in *.zip;
# do
# 	unzip "$a";
# done

mkdir csv;
mv *.csv csv;

mkdir zip;
mv *.zip zip;
