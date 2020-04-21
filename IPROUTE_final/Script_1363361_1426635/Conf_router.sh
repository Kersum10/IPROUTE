#!/bin/bash
#eth0
ip route add 192.168.0.0/24 dev eth0 src 192.168.0.2 table TABLE1
ip route add default via 192.168.0.1 table TABLE1
ip rule add from 192.168.0.2 table TABLE1

#eth1
ip route add 192.168.1.0/24 dev eth1 src 192.168.1.2 table TABLE2
ip route add default via 192.168.1.1 table TABLE2
ip rule add from 192.168.1.2 table TABLE2

#añadir reglas a tabla para mantener configuración
echo "200 TABLE1" >> /etc/iproute2/rt_tables
echo "201 TABLE2" >> /etc/iproute2/rt_tables

#ip route add default via 192.168.1.1 dev eth1 

#para controlar luego el balanceo de carga
ip route add default scope global nexthop via 192.168.0.1 dev eth0 weight 1 nexthop via 192.168.1.1 dev eth1 weight 1

#agregamos nuevo filtro a las entradas y redirigiendolas, asi aceptamos. 
#Para cada subred 
iptables -t filter -I FORWARD 1 -s 192.168.2.32/27 -j ACCEPT
iptables -t filter -I FORWARD 2 -s 192.168.2.64/27 -j ACCEPT
iptables -t filter -I FORWARD 3 -s 192.168.2.96/27 -j ACCEPT
iptables -t filter -I FORWARD 4 -s 192.168.2.128/27 -j ACCEPT
iptables -t filter -I FORWARD 5 -s 192.168.2.160/27 -j ACCEPT
iptables -t filter -I FORWARD 6 -s 192.168.2.192/27 -j ACCEPT
iptables -t filter -I FORWARD 7 -s 192.168.2.224/27 -j ACCEPT
