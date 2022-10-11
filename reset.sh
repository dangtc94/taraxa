cd ~/taraxa-ops-master/taraxa_compose
wget -O docker-compose-new.yml https://raw.githubusercontent.com/Taraxa-project/taraxa-ops/master/taraxa_compose/docker-compose.yml && mv docker-compose-new.yml docker-compose.yml
sudo docker-compose down -v
sleep 1
sudo docker-compose pull
sleep 1
rm -f config/testnet.json
sudo docker-compose up -d