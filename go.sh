mv ~/quick-n-dirty-defcoin-wallet ~/.defcoin
cd ~/.defcoin
chmod +x init.sh
./init.sh
chmod +x monsync.sh
time ./monsync.sh
#i like to time long things like this (output will be 5m short)
