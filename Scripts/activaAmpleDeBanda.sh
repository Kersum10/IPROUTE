#!/bin/bash
prueba() {
#echo "Esto está COMPLICATED"
tc qdisc add dev $1 root handle 1: prio bands 8
}

#tc qdisc per eth0
prueba eth0

#Para probar, se puede ejecutar en cada consola.
#watch -n 1 tc -s qdisc show dev eth0
#watch -n 1 tc -s qdisc show dev eth1
