# Lab 1 Part 1 - Bridge Configuration Solution

## What You Need to Do

This lab requires you to create a Linux bridge on the switch node to connect 4 hosts (host1, host2, host3, host4) so they can communicate with each other.

## Topology

```
host1 ----+
          |
host2 ----+-- switch (bridge) --+-- host3
          |                     |
host4 ----+                     +-- host4
```

- 4 hosts connected to a switch
- Switch has 4 interfaces: eth1, eth2, eth3, eth4
- Each host connects to one switch interface
- You need to configure the switch as a bridge

## Solution

The complete solution is already implemented in `do-lab.sh`:

```bash
#!/bin/bash

# Create a bridge on the switch node
docker exec clab-lab1-part1-switch ip link add name mybridge type bridge

# Bring the bridge up
docker exec clab-lab1-part1-switch ip link set mybridge up

# Add all 4 interfaces to the bridge
docker exec clab-lab1-part1-switch ip link set eth1 master mybridge
docker exec clab-lab1-part1-switch ip link set eth2 master mybridge
docker exec clab-lab1-part1-switch ip link set eth3 master mybridge
docker exec clab-lab1-part1-switch ip link set eth4 master mybridge
```

## How to Run the Lab

### Prerequisites
1. Install Vagrant
2. Install VirtualBox or another Vagrant provider
3. Start the VM: `vagrant up`
4. SSH into the VM: `vagrant ssh`

### Inside the VM
1. Navigate to the lab directory: `cd /vagrant/lab1/part1`
2. Run the submission script: `./provided/capture_submission.sh`
3. This will create `submission.tgz` for upload to Coursera

## What the Bridge Does

1. **Creates a virtual bridge interface** (`mybridge`) on the switch
2. **Brings the bridge up** so it can forward traffic
3. **Adds all 4 interfaces to the bridge** so they act as bridge ports
4. **Enables packet forwarding** between all connected hosts

## Verification

After the bridge is created, you can verify it's working by:

1. **Check bridge status**: `docker exec clab-lab1-part1-switch ip link show type bridge`
2. **Check bridge ports**: `docker exec clab-lab1-part1-switch bridge link show`
3. **Test packet flow**: The submission script will automatically test packet flow between hosts

## Expected Results

- All 4 hosts should be able to communicate with each other
- Packets sent from any host should reach their destination
- The bridge will learn MAC addresses and forward traffic appropriately
- The submission script will capture packet traces to verify connectivity

## Files Modified

- `do-lab.sh` - Contains the bridge configuration commands
- All other files are provided and should not be modified

## Submission

The `capture_submission.sh` script will:
1. Deploy the containerlab topology
2. Run your `do-lab.sh` script
3. Test packet flow between hosts
4. Capture packet traces
5. Create `submission.tgz` for upload

Your solution is complete and ready for submission!
