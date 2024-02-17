#!/bin/bash
#Aqui comparamos si el numero de argumentos pasados al script es difrente a 1
if [ $# -ne 1 ]; then
	echo "Tienes que poner un nombre de usuario."
	exit 1
fi
#Damos 3 opciones
echo "1.El usuario tiene permisos de administrador?"
echo "2.EL usuario existe?"
echo "3.Ruta del directorio personal es valida o existe?"
echo -n "Seleciona (1-2-3): "
read input

case $input in
1) #Comprobamos los permisos de administrador con sudo -lU 
	if sudo -lU $1 &> /dev/null; then
		echo "Tiene permisos de administrador"
	else
		echo "No tiene permisos de administrador"
	fi
	;;
2) #comprobamos si existe el usuario con 'id' que muestra la informacion del usuario
	if id $1 &> /dev/null; then
		echo "El usuario existe"
	else
		echo "El usuario no existe"
	fi
	;;
3) #Comprobamos si es valido el directorio personal con -d que devuelve true si existe o es correcto y false lo contrario
	if [ -d /home/$1 ]; then
		echo "EL directorio es validio"
	else
		echo "El directorio no es valido o no existe"
	fi


esac
