#!/bin/bash
# exit if anything returns failure
set -e

# update package list
apt-get update
apt-get install -y apache2 pache2-mpm-worker

