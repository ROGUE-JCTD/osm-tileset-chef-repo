#!/bin/bash
# exit if anything returns failure
set -e

# Install initial packages to stage the server.

# Update the package list
apt-get update

# Initial packages requirements
apt-get install -y curl
apt-get install -y git
apt-get install -y libpq-dev
