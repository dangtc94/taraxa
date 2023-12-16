#!/bin/sh

foldername="t03"
folderdata="$foldername_data"

cd $HOME
cd taraxa/$foldername
docker compose down

sleep 1

sed -i 's/"db_max_snapshots" : 1/"db_max_snapshots" : 0/gi' ./config/testnet.json
sed -i 's/"db_snapshot_each_n_pbft_block" : 10000/"db_snapshot_each_n_pbft_block" : 0/gi' ./config/testnet.json

cd /var/lib/docker/volumes/$folderdata/_data/db && rm -rf !("db"|"state_db")

sleep 1

cd $HOME
cd taraxa/$foldername
docker compose up -d
docker compose logs -f



# https://discord.com/channels/419749122556297216/419749122556297218/1172913171900665936

# docker ps --format "{{.Names}}"

# cp -r ./db /var/lib/docker/volumes/t02_data/_data

# dangcao
# t01
# t02


# dieuts
# t03
# t04

# quyetpham
# t05
# t06 ok
# t15
# t16 ok

# binh nguyen
# t07
# t08 ok
# t13 ok
# t14

# thandam
# t09
# t10
# t11
# t12 ok