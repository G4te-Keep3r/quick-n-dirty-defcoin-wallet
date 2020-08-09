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
