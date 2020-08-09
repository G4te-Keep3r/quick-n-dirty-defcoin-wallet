git clone https://github.com/G4te-Keep3r/quick-n-dirty-defcoin-wallet.git
cd quick-n-dirty-defcoin-wallet
./init.sh


to execute rpc calls
~/quick-n-dirty-defcoin-wallet/bin/defcoin-cli -conf=~/quick-n-dirty-defcoin-wallet/data/defcoin.conf getblockchaininfo
***working on removing the need for specifying conf***


relaunch wallet
~/quick-n-dirty-defcoin-wallet/bin/defcoind -conf=~/quick-n-dirty-defcoin-wallet/data/defcoin.conf


built off docker-droid (go back and insert link when flushing out readme)