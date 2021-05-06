why
---
get a precompiled running defcoin wallet (v1.0.0), and bootstrap download/import to speed up syncing. You can kill monsync.sh if you want (or leave it running in a screen), as all it does is monitor import progress. If you relaunch the wallet, monsync.sh would allow you to monitor to know when everything is back to normal.

install
---
```
git clone https://github.com/G4te-Keep3r/quick-n-dirty-defcoin-wallet.git
cd quick-n-dirty-defcoin-wallet

chmod +x go.sh
./go.sh
```


example commands
---
```
defcoin-cli getbalance
defcoin-cli getblockchaininfo
```
stop defcoind
```
defcoin-cli stop
```
relaunch wallet
```
defcoind -daemon
```

see https://en.bitcoin.it/wiki/Original_Bitcoin_client/API_calls_list for more


todo
---
rpcuser/password randomly generated



built off docker-droid (go back and insert link when flushing out readme)
