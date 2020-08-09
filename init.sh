#!/bin/sh
#!/usr/bin/env bash

sudo apt-get update && apt-get upgrade -y && apt-get install -y build-essential git perl sqlite3 libsqlite3-dev jq wget tar curl bc vim

# Should look for bootstrap.dat.old, but for some reason that method wasn't working
# Or looking for downloaded/extracted files, but again was not having luck
if [ ! -f "/src/droid/bootstrap_downloaded.txt" ]; then
	wget https://static.coindroids.com/defcoin-bootstrap.dat.tgz
	tar -zxf defcoin-bootstrap.dat.tgz
	mv bootstrap.dat ~/quick-n-dirty-defcoin-wallet/data/bootstrap.dat
	rm -rf defcoin-bootstrap.dat.tgz
	echo "bootstrap downloaded" > /src/droid/bootstrap_downloaded.txt
fi

~/quick-n-dirty-defcoin-wallet/bin/defcoind -conf=~/quick-n-dirty-defcoin-wallet/data/defcoin.conf
echo 'Defcoin Node initiating'

# Check to see if the wallet is finally sync'd
###############################################################
# prob need a diff print out for when not importing bootstrap but just catching up
###############################################################
echo 'Defcoind started with a snapshot, so it will sync a lot faster than normal but still might take 30-60min'
progress=`~/quick-n-dirty-defcoin-wallet/bin/defcoin-cli -conf=~/quick-n-dirty-defcoin-wallet/data/defcoin.conf getblockchaininfo | jq -r '.verificationprogress'`
progress=`awk "BEGIN { print ${progress} + 0.01 }"`
echo 'Checking on wallet status, must be up to date before starting bot'
echo "Current Defcoin Sync progress: ${progress}"
while (( $(echo "${progress} < 0.98" | bc -l ) ))
do
	progress=`~/quick-n-dirty-defcoin-wallet/bin/defcoin-cli -conf=~/quick-n-dirty-defcoin-wallet/data/defcoin.conf getblockchaininfo | jq -r '.verificationprogress'`
	progress=`awk "BEGIN { print ${progress} + 0.01 }"`
	echo "Sync Progress: ${progress} (This takes a long time and may even look like it's going backwards)"
	sleep 1m
done
echo 'Sync complete'
