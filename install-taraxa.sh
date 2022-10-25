#!/bin/bash
if [[ $(which docker) && $(docker --version) ]]; then
    echo "Docker installed!"
    # command
  else
    wget -O get-docker.sh https://get.docker.com 
    sudo sh get-docker.sh
    sleep 1
    sudo apt install -y docker-compose
    rm -f get-docker.sh
    sleep 1
fi
 apt install unzip
cd ~/
wget https://github.com/Taraxa-project/taraxa-ops/archive/refs/heads/master.zip && unzip master.zip && rm -f master.zip

sleep 1
cd ~/taraxa-ops-master/taraxa_compose
sleep 1
sudo docker-compose up -d
#sudo docker-compose logs -f

sleep 3

docker exec taraxa_compose-node-1 cat /opt/taraxa_data/conf/wallet.json

docker exec taraxa_compose-node-1 taraxa-sign sign --wallet /opt/taraxa_data/conf/wallet.json

docker exec taraxa_compose_node_1 cat /opt/taraxa_data/conf/wallet.json

docker exec taraxa_compose_node_1 taraxa-sign sign --wallet /opt/taraxa_data/conf/wallet.json