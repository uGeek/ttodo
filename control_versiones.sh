#!/bin/bash
#
#   Crea una carpeta oculta llamada .todo.txt y dentro crea un archivo vacio todo.txt para iniciar el script
#   
#   Ejecuta el script con cron, por ejemplo cada 2 minutos
#   
#   */2 * * * * /home/angel/.control_versiones.sh
#

TODOTXT="/home/angel/todo/todo.txt"
FOLDER="/home/angel/todo/.todotxt/"



COMPARA=$(diff $TODOTXT $FOLDER/todo.txt)

if [ "$COMPARA" != "" ] 
then
mv $FOLDER/todo.txt $FOLDER/$(date +%y%m%d-%H%M)_todo.txt
cp $TODOTXT $FOLDER/todo.txt
fi
