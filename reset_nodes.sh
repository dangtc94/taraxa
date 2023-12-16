#!/bin/sh

# stop all dockers
for dir in */; do

    cd $dir
	
	docker-compose down -v
	
	cd  ..

done

sleep 1

i=1
for dir in */; do

    cd $dir
	
	wget https://raw.githubusercontent.com/Taraxa-project/taraxa-ops/master/taraxa_compose/docker-compose.light.yml -O docker-compose.yml

	sed -i "s/10002/$(( i + 10002 ))/gi" docker-compose.yml	
	sed -i "s/7777/$(( i + 7777 ))/gi" docker-compose.yml
	sed -i "s/8777/$(( i + 8777 ))/gi" docker-compose.yml
	sed -i "s/3000/$(( i + 3000 ))/gi" docker-compose.yml
	
	docker-compose pull
	rm -f config/testnet.json
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