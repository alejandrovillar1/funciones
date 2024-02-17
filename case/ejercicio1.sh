#!/bin/bash
#Hacemos un bucle que siempre este activo salvo que  el usuario ya no quiera
while $vueltas; do
	echo -n "Menuda vuelta mas guapa... quieres otra? ('si' o 'no')"
	read respuesta
	#Creamos el case eligineod diferentes opciones
	case $respuesta in
		no)
		echo "Hasta luego!"
		open "https://www.youtube.com/watch?v=jaLDoWqIq2M"
		vueltas=false
		;;
		si)
		echo "Vamooos" 
		;;
		#Como la mayoria de usuarios son poco inteligentes y se confunden
		#le recorados que el programa funciona solo si el resultado es  'si' o 'no'
		*)
		echo "Solo pon 'si' o 'no'"
		;;
	esac
done
