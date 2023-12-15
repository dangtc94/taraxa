#!/bin/sh

# stop all dockers
for dir in */; do

    cd $dir
	
	docker-compose down
	
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
	docker-compose up -d
	
	cd  ..
	i=$(( i + 1 ))
done