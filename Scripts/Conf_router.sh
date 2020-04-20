#!/bin/bash
ip route add default via 192.168.1.1 dev eth1 

ip route add default scope global nexthop via 192.168.0.1 dev eth0 weight 1 nexthop via 192.168.1.1 dev eth1 weight 1

iptables -A FORWARD -s 192.168.2.32/27 -j ACCEPT
iptables -A FORWARD -s 192.168.2.64/27 -j ACCEPT
iptables -A FORWARD -s 192.168.2.96/277 -j ACCEPT
iptables -A FORWARD -s 192.168.2.128/27 -j ACCEPT
iptables -A FORWARD -s 192.168.2.160/27 -j ACCEPT
iptables -A FORWARD -s 192.168.2.192/27 -j ACCEPT
iptables -A FORWARD -s 192.168.2.224/27 -j ACCEPT
