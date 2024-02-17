#!/bin/bash
#Esta variable para que es un numero de error
USG_ERR=7
#La funcion de abajo parece que compara si el primer parametro es igual al segundo y si es igual printea 'Iguals' y hace 'exit 0' que finaliza el script de manera exitosa. Tambien hay un elif que compara si el primer parametro es mas grande que el segundo y si es asi cra una variable con el valor del primer parametro de lo contrario crea la variable con el valor del segundo parametro
max_dos ( ) {
	if [ "$1" -eq "$2" ] ; then
		echo 'Iguals'
		exit 0
	elif [ "$1" -gt "$2" ] ; then
		ret_val=$1
	else
		ret_val=$2
	fi
}
#Esta funcion para ser algun tipo de funcion de error que printea el nombre del archivo con los parametros que se deberuian de introducir y sale del script con el error de la variable de arriba 
err_str ( ) {
	echo "Ús: $0 <numero1>  <numero2>"
	exit $USG_ERR
}
#REcoje los parametros y los guarda en dos variables diferentes
NUM_1=$1
NUM_2=$2
#COmprueba si se pasaron 2 parametros al script, si no se pasaron llama a la funcion de error
if [ $# -ne 2 ] ; then
	err_str
elif [ `expr $NUM_1 : '[0-9]*'` -eq ${#NUM_1} ] ; then
	if [ `expr $NUM_2 : '[0-9]*'` -eq ${#NUM_2} ] ; then  #Si ambos numeros son un numero se llama a la funcion de max_dos de lo contrario se llama a la funcion de er_str
		max_dos $NUM_1 $NUM_2
		echo $ret_val
	else
		err_str
	fi
else
	err_str
fi

exit 0
