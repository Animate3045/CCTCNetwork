#!/bin/bash
echo "Enter network address (e.g. 192.168.0): "
read net
echo "Enter starting host range (e.g. 1): "
read start
echo "Enter ending host range (e.g. 254): "
read end
echo "Enter ports space-delimited (e.g. 21-23 80): "
read ports
for ((i=$start; $i<=$end; i++))
do
    nc -nvzw1 $net.$i $ports 2>&1 | grep -E 'succ|open'
done

Netcat - UDP Scan Script

#!/bin/bash
echo "Enter network address (e.g. 192.168.0): "
read net
echo "Enter starting host range (e.g. 1): "
read start
echo "Enter ending host range (e.g. 254): "
read end
echo "Enter ports space-delimited (e.g. 21-23 80): "
read ports
for ((i=$start; $i<=$end; i++))
do
    nc -nuvzw1 $net.$i $ports 2>&1 | grep -E 'succ|open'
done

Netcat - Banner Grabbing

    Find what is running on a particular port

nc [Target IP] [Target Port]
nc 172.16.82.106 22
nc -u 172.16.82.106 53

    -u : To switch to UDP

Describe Methods Used for Passive Internal Discovery
recon3
Packet Sniffers

    Wireshark

    Tcpdump

    p0f

Limited to traffic in same local area of the network
Describe Methods Used for Active Internal Discovery
recon4
7.25
Netcat - TCP Scan Script#!/bin/bash echo "Enter network address (e.g. 192.168.0): " read net echo "Enter starting host range (e.g. 1): " read start echo "Enter ending host range (e.g. 254): " read end echo "Enter ports space-delimited (e.g. 21-23 80): " read ports for ((i=$start; $i<=$end; i++)) do nc -nvzw1 $net.$i $ports 2>&1 | grep -E 'succ|open' done