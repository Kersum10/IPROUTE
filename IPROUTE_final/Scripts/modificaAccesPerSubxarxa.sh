
#!/bin/bash
#pugui especificar si es vol permetre ACCEPT
#o tallar l’accés a internet DROP 

#IN: $1 $2 --> $1=red a agregar; $2 = regla
# --> ./modificaAccesPerSubxarxa 192.178.2.0 ACCEPT

#TODO: MEJORAR PARA COMPROBAR RANGO PERMITIDO O FORMATO ip
if [ $2 == 'ACCEPT' ]; then
	iptables -I FORWARD -s $1 -j ACCEPT
	echo "Nueva regla agregada, se agregará con prioridad en la tabla"

elif [ $2 == 'DROP' ]; then
	iptables -I FORWARD -s $1 -j DROP
	echo "Regla borrada para la red"
else
	echo "ERROR DE SINTAXIS"
	echo "Sintaxis: ./modificaAccesPerSubxarxa.sh [SUBNET] [DROP/ACCEPT]"
fi

