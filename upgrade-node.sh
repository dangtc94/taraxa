cd $HOME
cd ~/taraxa-ops-master/taraxa_compose
wget -O docker-compose-new.yml https://raw.githubusercontent.com/Taraxa-project/taraxa-ops/master/taraxa_compose/docker-compose.yml && mv docker-compose-new.yml docker-compose.yml
sudo docker-compose down
sudo docker-compose pull
sudo docker-compose up -d
sleep 2
echo "printing log...\n"
sudo docker-compose logs -f