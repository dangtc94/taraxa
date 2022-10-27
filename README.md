
**install**
wget -O install-taraxa.sh https://bitbucket.org/dieuts/taraxa/raw/master/install-taraxa.sh && chmod +x install-taraxa.sh && ./install-taraxa.sh


wget -O upgrade.sh https://bitbucket.org/dieuts/taraxa/raw/master/upgrade.sh && chmod +x upgrade.sh && ./upgrade.sh


docker exec taraxa_compose-node-1 cat /opt/taraxa_data/conf/wallet.json


docker exec taraxa_compose-node-1 taraxa-sign sign --wallet /opt/taraxa_data/conf/wallet.json