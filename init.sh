#!/bin/sh
#!/usr/bin/env bash

sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get install -y build-essential git perl sqlite3 libsqlite3-dev jq wget tar curl bc vim

wget https://static.coindroids.com/defcoin-bootstrap.dat.tgz
tar -zxf defcoin-bootstrap.dat.tgz
mv bootstrap.dat data/bootstrap.dat
rm -rf defcoin-bootstrap.dat.tgz
echo "bootstrap downloaded"

chmod +x bin/*
echo "bin contains executables now"

echo PATH=$PATH:~/.defcoin/bin >> ~/.bashrc
PATH=~/.defcoin/bin:"$PATH"
echo "bin added to path, starting wallet"

defcoind -daemon
#only waits 1m on docker droid, but this application needed a longer wait
echo 'Defcoin Node initiating while we wait 5m' #5m prob way too long
sleep 5m
echo 'and now to watch import and sync'
