#!/bin/bash
#
#  Hacer un archivo de configuración tipo:
#   
#  @TODO
#  @NEXT
#  @DONE
#
#  taskell config_file
#

grep -v "$(cat $1 | sed -n 1p)" todo.txt | grep -v "$(cat $1 | sed -n 2p)" | grep -v "$(cat $1 | sed -n 3p)" > todot.txt 
grep "$(cat $1 | sed -n 1p)" todo.txt >  todoe.txt
grep "$(cat $1 | sed -n 2p)" todo.txt >> todoe.txt
grep "$(cat $1 | sed -n 3p)" todo.txt >> todoe.txt

echo "## $(cat $1 | sed -n 1p)" > $1.md
echo "" >> $1.md 
grep $(cat $1 | sed -n 1p) todoe.txt  | sed 's/^/- /' >> $1.md
echo "" >> $1.md

echo "## $(cat $1 | sed -n 2p)" >> $1.md
echo "" >> $1.md
grep $(cat $1 | sed -n 2p) todoe.txt  | sed 's/^/- /' >> $1.md
echo "" >> $1.md

echo "" >> $1.md
echo "## $(cat $1 | sed -n 3p)" >> $1.md
echo "" >> $1.md
grep $(cat $1 | sed -n 3p) todoe.txt  | sed 's/^/- /' >> $1.md
echo "" >> $1.md


taskell $1.md


cat todot.txt > todo.txt
cat $1.md | sed s'|- ||'g | grep -v "^##" | grep . >> todo.txt
