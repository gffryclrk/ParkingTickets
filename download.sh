#!/bin/bash
#download some files

url="http://opendata.toronto.ca/revenue/parking/ticket/parking_tickets_"
declare -a years=("2008" "2009" "2010" "2011" "2012" "2013" "2014" "2015" "2016" "2017" "2018")
yearslength=${#years[@]}

for (( i=0; i<${yearslength}; i++));
do
	#echo ${url}${years[$i]}".zip"
	wget ${url}${years[$i]}".zip"
done

for a in *.zip;
do
	unzip "$a";
done

mkdir csv;
mv *.csv csv;

mkdir zip;
mv *.zip zip;
