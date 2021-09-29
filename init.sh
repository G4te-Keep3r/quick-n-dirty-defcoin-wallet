#!/bin/sh
#!/usr/bin/env bash

sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get install -y build-essential git perl sqlite3 libsqlite3-dev jq wget tar curl bc vim

echo "generating random rpc user and password"
echo >> ~/.defcoin/defcoin.conf
# already installing a bunch of things, maybe go back to "pwgen 14 1" and add pwgen to line 4. This would be cleaner/easier to read
echo rpcuser=$(LC_ALL=C tr -dc 'A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}~' </dev/urandom | head -c 15) >> ~/.defcoin/defcoin.conf
echo rpcpassword=$(LC_ALL=C tr -dc 'A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}~' </dev/urandom | head -c 15) >> ~/.defcoin/defcoin.conf
echo >> ~/.defcoin/defcoin.conf

wget https://static.coindroids.com/defcoin-bootstrap.dat.tgz
tar -zxf defcoin-bootstrap.dat.tgz
#mkdir data
#mv bootstrap.dat data/bootstrap.dat
rm -rf defcoin-bootstrap.dat.tgz
echo "bootstrap downloaded"

chmod +x bin/*
echo "bin contains executables now"

echo PATH=$PATH:~/.defcoin/bin >> ~/.bashrc
PATH=~/.defcoin/bin:"$PATH"
echo "bin added to path, starting wallet"

defcoind -daemon
#only waits 1m on docker droid, but this application needed a longer wait
### idr why it needed longer, but since defcoin-cli is working right after it launches...im gonna set it to 2m for now

echo 'Defcoin Node initiating while we wait 2m' #5m prob way too long
sleep 2m
echo 'and now to watch import and sync'
