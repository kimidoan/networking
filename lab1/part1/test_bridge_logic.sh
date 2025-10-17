#!/bin/bash

# Test script to verify bridge configuration logic
# This simulates what the bridge configuration should do

echo "=== Bridge Configuration Test ==="
echo "This script shows what commands will be executed in the actual lab environment"
echo ""

echo "1. Creating bridge on switch node:"
echo "   docker exec clab-lab1-part1-switch ip link add name mybridge type bridge"
echo ""

echo "2. Bringing bridge up:"
echo "   docker exec clab-lab1-part1-switch ip link set mybridge up"
echo ""

echo "3. Adding interfaces to bridge:"
echo "   docker exec clab-lab1-part1-switch ip link set eth1 master mybridge"
echo "   docker exec clab-lab1-part1-switch ip link set eth2 master mybridge"
echo "   docker exec clab-lab1-part1-switch ip link set eth3 master mybridge"
echo "   docker exec clab-lab1-part1-switch ip link set eth4 master mybridge"
echo ""

echo "=== Expected Result ==="
echo "After these commands, all 4 hosts (host1, host2, host3, host4) should be able to communicate"
echo "through the switch acting as a bridge. Packets sent from any host should be forwarded"
echo "to the appropriate destination host through the bridge."
echo ""

echo "=== Verification Commands ==="
echo "To verify the bridge is working:"
echo "1. Check bridge status: docker exec clab-lab1-part1-switch ip link show type bridge"
echo "2. Check bridge ports: docker exec clab-lab1-part1-switch bridge link show"
echo "3. Test connectivity: Use the provided onepkt.py script to send packets between hosts"
echo ""

echo "=== Lab Submission ==="
echo "To submit your lab:"
echo "1. Make sure you're in the Vagrant VM (vagrant up && vagrant ssh)"
echo "2. Navigate to /vagrant/lab1/part1"
echo "3. Run: ./provided/capture_submission.sh"
echo "4. This will create submission.tgz for upload to Coursera"
