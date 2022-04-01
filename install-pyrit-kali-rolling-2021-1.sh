#!/bin/bash

# Install dependencies
sudo apt-get update
sudo apt-get install -y \
	python2-dev \
	libssl-dev \
	libpcap-dev \
	python3-scapy

# Clone Repo
git clone https://github.com/JPaulMora/Pyrit.git --depth=1

# Fudge code as suggested in https://github.com/JPaulMora/Pyrit/issues/591
sed -i "s/COMPILE_AESNI/COMPILE_AESNIX/" Pyrit/cpyrit/_cpyrit_cpu.c

# Build and install
cd Pyrit
python2.7 setup.py clean
python2.7 setup.py build
sudo python2.7 setup.py install
cd ..

# Clean Up
rm -rf Pyrit
