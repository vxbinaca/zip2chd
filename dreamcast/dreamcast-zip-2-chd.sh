#!/bin/bash

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

beforesize=$( du -h -d 0 ./ )
aftersize=$( du -h -d 0 --exclude=*.zip )

# Create tmp dir if it does not exist
echo -e "${Green}Creating TMP if it does not exist and cleaning dir if it does."
mkdir ./tmp
rm ./tmp/*

for i in ./*.zip; do

	echo -e "${Green}Unzipping $i."
	echo -e "${Yellow}"
	unzip "$i" -d ./tmp

	echo -e "${Green}Entering TMP."
	cd ./tmp
	
	echo -e "${Green}Creating CHD."
	### Could be used for looping but why ###
	#for j in *.gdi; do chdman createcd -i "$j" -o "${j%.*}.chd"; done
	
	### This will work only if gdi match the zip name ###
	#chdman createcd -i "${i%.*}.gdi" -o "${i%.*}.chd" 

	echo -e "${Yellow}"
	chdman createcd -i *.gdi -o "${i%.*}.chd" 

	echo -e "${Green}Moving CHD file to main DIR"
	mv *.chd ../
	
	echo -e "${Green}Cleaning tmp"
	rm -v ./*
	
	echo -e "${Green}Looping back to main dir and starting next game set."
	cd ..
done

echo -e "${Green}Moving zip's to zips folder for cleanup"
mv ./*.zip ./zips

echo -e "${Red}All DONE!!!"
echo -e "Before size: $beforesize"
echo -e "After size: $aftersize"
