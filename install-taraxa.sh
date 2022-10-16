
wget -O get-docker.sh https://get.docker.com 
sudo sh get-docker.sh
sleep 1
sudo apt install -y docker-compose
rm -f get-docker.sh

sleep 1
cd ~/
wget https://github.com/Taraxa-project/taraxa-ops/archive/refs/heads/master.zip && unzip master.zip && rm -f master.zip

sleep 1
cd ~/taraxa-ops-master/taraxa_compose
sleep 1
sudo docker-compose up -d
#sudo docker-compose logs -f