#!/bin/bash

#Pedimos el servidor a conectarse y el comando
echo "INtroduce el servidor para conectarse y el comando a utilizar"
echo -n "Servidor: "
read servidor
echo -n "Comando: "
read comando

#Ejecutamos el ssh
ssh $servidor << EOF
$comando
EOF
