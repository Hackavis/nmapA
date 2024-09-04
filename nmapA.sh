#!/bin/bash

#Colores
verde="\e[0;32m\033[1m"
rojo="\e[0;31m\033[1m"
fincolor="\033[0m\e[0m"

function ctrl_c(){
    echo -e "\n ${rojo}[*] Saliendo del programa \n${fincolor}"
    rm ports.tmp
    exit 1
}

# Control+C
trap ctrl_c INT

# Comprobación de argumentos
    if ! [ $(id -u) = 0 ]; then 
	echo -e "\n ${rojo}[*] Debes utilizar sudo o ser root \n${fincolor}"
	exit 1 
    fi
    if [ $# -eq 1 ]; then
    	if [[ "$1" =~ ^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$ ]]; then
        	echo -e "\n ${verde}[*] Reconocimiento inicial de puertos \n${fincolor}"
            	ip=$1
            	nmap -p- -sS --min-rate 5000 --open -Pn -v -n $ip -oG ports.tmp
    	else
            	echo -e "\n ${rojo}[*] Introduce una IPv4 correcta \n${fincolor}" 
	         	exit 1
        fi
    elif [ $# -eq 0 ]; then
	ip a | grep "tun0" &>/dev/null && echo -e "\n ${rojo}[*] Estás bajo una VPN, introduce una IPv4 correcta \n${fincolor}" && exit 1
	ip=$(sudo arp-scan -l | grep "PCS" | cut -f1 | tail -n1)
	if [[ $ip = "" ]]; then
		echo -e "\n ${rojo}[*] No se ha detectado ninguna IP de la máquina víctima ${fincolor}\n"
		exit 1
	fi
	echo -e "\n ${verde}[*] La IP de la máquina víctima es $ip${fincolor}\n"
	nmap -p- -sS --min-rate 5000 --open -Pn -vvv -n $ip -oG ports.tmp
    else
        echo -e "\n ${rojo}[*] Introduce solamente la IP a escanear${fincolor}\n"
        exit 1
    fi

# Escaneo de puertos
    ports="$(cat ports.tmp | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')"
    	if [[ $ports = "" ]]; then
		echo -e "\n ${rojo}[*] No se ha detectado ningún puerto abierto de la máquina víctima \n${fincolor}"
		rm ports.tmp
		exit 1
		fi
    echo -e "\n ${verde}[*] Escaneo avanzado de servicios\n${fincolor}" 
    nmap -sCV -p$ports $ip -oN InfoPuertos
    sed -i '1,3d' InfoPuertos
    echo -e "\n \t[*] Dirección IP: $ip" >> InfoPuertos
    echo -e "\t[*] Puertos abiertos: $ports\n" >> InfoPuertos
    rm ports.tmp
    echo -e "\n ${verde}[*] Escaneo completado, se ha generado el fichero InfoPuertos \n${fincolor}" 
    echo $ip | xclip -sel clip
