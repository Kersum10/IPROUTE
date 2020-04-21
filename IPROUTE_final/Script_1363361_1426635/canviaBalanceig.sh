#!/bin/bash
#ip route add default scope global nexthop via IPrang dev interfaz weight 1 \
#nexthop via $P2 dev $IF2 weight 1

IP1=192.168.0.1
IP2=192.168.1.1
weight=$2
ETH0=eth0
ETH1=eth1

ip route add default scope global nexthop via $IP1 dev $ETH0 weight $1 nexthop via $IP2 dev $ETH1 weight $2
printf "Se ha balanceado la carga de $IP1 - $ETH0 con peso $1 y $IP2 - $ETH1 con peso $2"

#ip route add default scope global nexthop via $IP2 dev eth1 weight $1 nexthop via $IP1 dev eth0 weight $2
#printf "Se ha balanceado la carga y el flujo de irá por $IP1 $ETH1 con peso $weight "
