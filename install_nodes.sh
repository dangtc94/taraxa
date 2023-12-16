#!/bin/sh

# if [[ $(which docker) && $(docker --version) ]]; then
#     echo "Docker installed!"
#     # command
#   else
#     wget -O get-docker.sh https://get.docker.com 
#     sudo sh get-docker.sh
#     sleep 1
#     sudo apt install -y docker-compose
#     rm -f get-docker.sh
#     sleep 1
# fi

noOfNodes=3
#create 3 nodes: 01 02 03

i=1

while [ "$i" -le $noOfNodes ]; do

	value=$(printf "%02d" $i)
	folderName="t$value"

	mkdir $folderName && cd $folderName
	
	wget https://raw.githubusercontent.com/Taraxa-project/taraxa-ops/master/taraxa_compose/docker-compose.light.yml -O docker-compose.yml

	sed -i "s/10002/$(( i + 10002 ))/gi" docker-compose.yml	
	sed -i "s/7777/$(( i + 7777 ))/gi" docker-compose.yml
	sed -i "s/8777/$(( i + 8777 ))/gi" docker-compose.yml
	sed -i "s/3000/$(( i + 3000 ))/gi" docker-compose.yml
	
	ufw allow $(( i + 10002 ))
	ufw allow $(( i + 7777 ))
	ufw allow $(( i + 8777 ))
	ufw allow $(( i + 3000 ))
	
	docker-compose up -d
	sleep 1

	docker-compose down

	sed -i 's/"db_max_snapshots" : 1/"db_max_snapshots" : 0/gi' ./config/testnet.json
	sed -i 's/"db_snapshot_each_n_pbft_block" : 10000/"db_snapshot_each_n_pbft_block" : 0/gi' ./config/testnet.json
	sleep 1

	docker-compose up -d

	cd  ..
	
    i=$(( i + 1 ))
done