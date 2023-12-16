#!/bin/sh

foldername="t03"
folderdata="${foldername}_data"

cd $HOME
cd taraxa/$foldername
docker compose down

sleep 1

sed -i 's/"db_max_snapshots" : 1/"db_max_snapshots" : 0/gi' ./config/testnet.json
sed -i 's/"db_snapshot_each_n_pbft_block" : 10000/"db_snapshot_each_n_pbft_block" : 0/gi' ./config/testnet.json

#cd /var/lib/docker/volumes/${folderdata}/_data/db && rm -rf !("db"|"state_db")
#exec('bash -c "shopt -s extglob && cd /var/lib/docker/volumes/'"$folderdata"'/_data/db && rm -rf !("db"|"state_db")')

cd /var/lib/docker/volumes/${folderdata}/_data/db
find -maxdepth 1 ! -name db ! -name state_db ! -name . -exec rm -rv {} \;

sleep 1

cd $HOME
cd taraxa/$foldername
docker compose up -d
docker compose logs -f
