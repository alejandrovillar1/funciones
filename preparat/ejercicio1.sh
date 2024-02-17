#!/bin/bash
#Creamos una lista con diferentes servidores remotos para comprobar
servidores_lista=("anonymous@pruebalandia.com" "aprobar@enmissueños.com")

#Funcion para comprobarlo
comprobar(){
	servidor=$1
	#Se hace un ping con -c 1 para mandar solamente un paquete
	mandaping=$(ping -c 1 $servidor &> /dev/null && echo "Hace ping correctamemte" || echo "No hace ping correctamente")
	echo "$servidor $mandaping"
}
#Funcion para añadir registro a un bloc de notas
añadir_registro(){
	#Añadimos la fecha de hoy junto con la hora y con el nombre del servidor
	echo "$(date '+%Y-%m-%d %H:%M:%S'): $1" >> registrodepings.txt
}
#Pasamos todos los servidores de la lista a cada funcion para que compruebe el status y añada u nregistro
for srv in "${servidores_lista[@]}"; do
	status=$(comprobar $srv)
	añadir_registro "$status"
done
