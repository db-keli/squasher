#!/bin/bash

#Hard stuff

afca(){
	git add "$file" && git commit -m "$mess"
}

aca(){
	git add . && git commit -m "$mess"
}

push(){
	git push
}

version(){
	echo "git ease v-0.0.1"
}

if [ "$1" == "-f" ];
then
	file=$2
	mess=$3
	afca
elif [ "$1" == "-a" ];
then
	mess=$2
	aca
elif [[ ( "$1" == "-f" && $2 == "-p" ) || ( "$1" == "-p" && $2 == "-f" ) ]]
then
	file=$3
	mess=$4
	afca
	printf "\nPushing\n"
	push
elif [[ ( "$1" == "-fp" ) || ( "$1" == "-pf" ) ]];
then 
	file=$2
	mess=$3
	afca
	printf "\nPushing\n"
	push
elif [ "$1" == "-p" ];
then 
	printf "\nPushing\n"
	push
elif [ "$1" == "-version" ];
then
	version
fi
