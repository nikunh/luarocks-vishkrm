#!/bin/bash
set -e

# Install LuaRocks 3.11.1
if ! command -v luarocks &> /dev/null; then
  curl -LO https://luarocks.org/releases/luarocks-3.11.1.tar.gz
  tar xvfz luarocks-3.11.1.tar.gz
  cd luarocks-3.11.1
  ./configure --lua-version=5.4
  make
  sudo make install
  cd ..
  rm -rf luarocks-3.11.1 luarocks-3.11.1.tar.gz
fi

# Clean up
sudo apt-get clean
