#!/bin/bash
# exit if anything returns failure
set -e

# Install initial packages to stage the server.

# Update the package list
apt-get update

# Install packages
apt-get install -y curl
apt-get install -y git
