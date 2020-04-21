
#!/bin/bash
#echo "prueba"
#ip route add default scope global nexthop via IPrang dev interfaz weight 1 \
#nexthop via $P2 dev $IF2 weight 1

IP1=192.168.0.1
IP2=192.168.1.1
weight=$2
ETH1=eth0
ETH2=eth1

if [ $1 == 'eth0' ]; then
	ip route add default scope global nexthop via $IP1 dev $1 weight $weight nexthop via $IP2 dev $ETH2 weight $weight
	printf "Se ha balanceado la carga y el flujo de irá por $IP2 $ETH2 con peso $weight "

elif [ $1 == 'eth1' ]; then
	ip route add default scope global nexthop via $IP2 dev $1 weight $weight nexthop via $IP1 dev $ETH1 weight $weight
	printf "Se ha balanceado la carga y el flujo de irá por $IP1 $ETH1 con peso $weight "

else 
	printf "\\nERROR DE SINTAXIS\\n"
	echo "./canviaBalanceig.sh [eth0/eth1] [carga/peso]"
fi

#comentario de prueba