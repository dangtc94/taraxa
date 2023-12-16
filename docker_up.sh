#!/bin/sh

#----------------------------------------------------
# NHO THAY THE WALLET
#----------------------------------------------------

noOfNodes=15
#create 3 nodes: 01 02 03

i=1

while [ "$i" -le $noOfNodes ]; do

	value=$(printf "%02d" $i)
	folderName="t$value"

	cd ./$folderName
	
	docker-compose up -d
	sleep 1
	
	cd  ..
	
    i=$(( i + 1 ))
done
