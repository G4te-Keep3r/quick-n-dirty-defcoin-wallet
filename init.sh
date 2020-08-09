#!/bin/sh
#!/usr/bin/env bash

sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get install -y build-essential git perl sqlite3 libsqlite3-dev jq wget tar curl bc vim

# Should look for bootstrap.dat.old, but for some reason that method wasn't working
# Or looking for downloaded/extracted files, but again was not having luck
if [ ! -f "~/quick-n-dirty-defcoin-wallet/bootstrap_downloaded.txt" ]; then
	wget https://static.coindroids.com/defcoin-bootstrap.dat.tgz
	tar -zxf defcoin-bootstrap.dat.tgz
	mv bootstrap.dat ~/quick-n-dirty-defcoin-wallet/data/bootstrap.dat
	rm -rf defcoin-bootstrap.dat.tgz
	echo "bootstrap downloaded" > ~/quick-n-dirty-defcoin-wallet/bootstrap_downloaded.txt
	echo "bootstrap downloaded"
fi

chmod +x ~/quick-n-dirty-defcoin-wallet/bin/*
echo "bin contains executables now, starting wallet"

~/quick-n-dirty-defcoin-wallet/bin/defcoind -conf=~/quick-n-dirty-defcoin-wallet/data/defcoin.conf -daemon
echo 'Defcoin Node initiating while we wait 5m'
sleep 5m
echo 'and now to watch import and sync'

