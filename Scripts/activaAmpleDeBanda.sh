#!/bin/bash

#Marcar
marcar(){
#ip route add 192.168.2.32/27 dev eth2 scope link realm 1
ip route add 192.168.2.32/27 dev eth2 realm 1
ip route add 192.168.2.64/27 dev eth2 realm 2
ip route add 192.168.2.96/27 dev eth2 realm 3
ip route add 192.168.2.128/27 dev eth2 realm 4
ip route add 192.168.2.160/27 dev eth2 realm 5
ip route add 192.168.2.192/27 dev eth2 realm 6
ip route add 192.168.2.224/27 dev eth2 realm 7
}

crearCola(){
#echo "Esto está COMPLICATED"
tc qdisc add dev $1 root handle 1: prio bands 8
tc qdisc add dev $1 root handle 1: prio bands 8
# tc qdisc add dev $1 parent 1:1 handle 1:10 tbf rate 3mbit ceil 6mbit burst 15k
tc qdisc add dev $1 parent 1:1 handle 10: tbf rate 20kbit latency 50ms burst 1540
tc qdisc add dev $1 parent 1:2 handle 20: tbf rate 40kbit latency 50ms burst 1540
tc qdisc add dev $1 parent 1:3 handle 30: tbf rate 60kbit latency 50ms burst 1540
tc qdisc add dev $1 parent 1:4 handle 40: tbf rate 80kbit latency 50ms burst 1540
tc qdisc add dev $1 parent 1:5 handle 50: tbf rate 100kbit latency 50ms burst 1540
tc qdisc add dev $1 parent 1:6 handle 60: tbf rate 150kbit latency 50ms burst 1540
tc qdisc add dev $1 parent 1:7 handle 70: tbf rate 300kbit latency 50ms burst 1540
tc qdisc add dev $1 parent 1:8 handle 80: tbf rate 500Mbit latency 50ms burst 1540 #router
}


marcar
crearCola eth0
crearCola eth1



#Para probar, se puede ejecutar en cada consola.
#watch -n 1 tc -s qdisc show dev eth0
#watch -n 1 tc -s qdisc show dev eth1
