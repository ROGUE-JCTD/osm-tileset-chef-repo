#!/bin/bash
# exit if anything returns failure
set -e

sudo apt-get install -y curl

gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
curl -L https://get.rvm.io | bash -s $1
