#!/usr/bin/env bash

source /opt/rh/devtoolset-2/enable
cd /tmp/ninja-1.8.2
./configure.py --bootstrap
install ninja /usr/local/bin
