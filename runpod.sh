#!/bin/bash
# Update package list and install necessary packages
apt update
apt -y install ocl-icd-opencl-dev
apt -y install nano
apt -y install htop
apt -y install nvtop
apt -y install cmake
apt -y install python3-pip

# ZEC Mining with lolMiner
apt update -y && apt install -y wget tar screen
cd /workspace
wget -q https://github.com/Lolliedieb/lolMiner-releases/releases/download/1.93/lolMiner_v1.93_Lin64.tar.gz -O m.tar.gz
tar -xzf m.tar.gz --no-same-owner || true
mv 1.93/lolMiner . || true
rm -rf 1.93 m.tar.gz
chmod +x lolMiner
pkill -f lolMiner || true
screen -dmS miner ./lolMiner --algo EQUI144_5 --pers ZcashPoW --pool stratum+tcp://zec.2miners.com:1010 --user t1V9i14nrKtpUnStdPN5wPrRGst88Pq7Vky.rig1 --pass x --devices 0 --cclk 1500 --mclk 5001 --pl 280 --apiport 4028
echo "ZEC mining started! screen -r miner"
tail -f /dev/null # Keep pod alive
