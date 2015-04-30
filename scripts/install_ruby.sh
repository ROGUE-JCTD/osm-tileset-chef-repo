#!/bin/bash
# exit if anything returns failure
set -e

 source /usr/local/rvm/scripts/rvm

 rvm use --install $1 --default

 shift

 if (( $# ))
 then gem install $@
 fi
