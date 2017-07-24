#!/bin/sh
#
set -e

SALTENV="myenv"

## Bootstrap Salt installation for various systems/distributions
#  https://github.com/saltstack/salt-bootstrap/issues
wget http://bootstrap.saltstack.com -O bootstarp-salt.sh
chmod +x bootstarp-salt.sh
./bootstarp-salt.sh -L -M -X -f -F stable

salt-call --local  state.highstate --file-root=/vagrant/environment/salt/base --retcode-passthrough -l error

