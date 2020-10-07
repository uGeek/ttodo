#!/bin/bash
#
#   Crea una carpeta oculta llamada .todo.txt y dentro crea un archivo vacio todo.txt para iniciar el script
#   
#   Ejecuta el script con cron, por ejemplo cada 2 minutos
#   
#   */2 * * * * /home/angel/.control_versiones.sh
#


FILE1="/home/angel/todo/todo.txt"
FILE2="/home/angel/todo/.todotxt/todo.txt"



COMPARA=$(diff $FILE1 $FILE2)

if [ "$COMPARA" != "" ]
then
mv $FILE2 $FILE2-$(date +%y%m%d-%H%M)
cp $FILE1 $FILE2
fi

