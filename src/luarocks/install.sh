#!/usr/bin/env zsh
set -e

# Logging mechanism for debugging
LOG_FILE="/tmp/luarocks-install.log"
log_debug() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') [DEBUG] $*" >> "$LOG_FILE"
}

# Initialize logging
log_debug "=== LUAROCKS INSTALL STARTED ==="
log_debug "Script path: $0"
log_debug "PWD: $(pwd)"
log_debug "Environment: USER=$USER HOME=$HOME"

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

log_debug "=== LUAROCKS INSTALL COMPLETED ==="
# Auto-trigger build Tue Sep 23 20:03:17 BST 2025
# Auto-trigger build Sun Sep 28 03:45:33 BST 2025
