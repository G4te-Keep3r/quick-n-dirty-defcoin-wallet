```
git clone https://github.com/G4te-Keep3r/quick-n-dirty-defcoin-wallet.git
cd quick-n-dirty-defcoin-wallet

#or any sudo command, just so script doesnt have issues
sudo ls

chmod +x init.sh
./init.sh
chmod +x monsync.sh
./monsync.sh

```
while loop line error if its in init.sh

to execute rpc calls
```
defcoin-cli getblockchaininfo
```
***working on removing the need for specifying conf***


stop defcoind
```
defcoin-cli stop
```


relaunch wallet
```
defcoind -daemon
```


built off docker-droid (go back and insert link when flushing out readme)