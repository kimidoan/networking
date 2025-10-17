#!/bin/bash

# INCLUDE ALL COMMANDS NEEDED TO PERFORM THE LAB
# This file will get called from capture_submission.sh

# Create a bridge on the switch node
docker exec clab-lab1-part1-switch ip link add name mybridge type bridge

# Bring the bridge up
docker exec clab-lab1-part1-switch ip link set mybridge up

# Add all 4 interfaces to the bridge
docker exec clab-lab1-part1-switch ip link set eth1 master mybridge
docker exec clab-lab1-part1-switch ip link set eth2 master mybridge
docker exec clab-lab1-part1-switch ip link set eth3 master mybridge
docker exec clab-lab1-part1-switch ip link set eth4 master mybridge

