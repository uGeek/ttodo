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
grep "$(cat $1 | sed -n 1p)" todo.txt | grep "$(cat $1 | sed -n 2p)" | grep "$(cat $1 | sed -n 3p)" > todor.txt

echo "## $(cat $1 | sed -n 1p)" > $1.md
echo "" >> $1.md 
grep $(cat $1 | sed -n 1p) todot.txt  | sed 's/^/- /' >> $1.md
echo "" >> $1.md

echo "## $(cat $1 | sed -n 2p)" >> $1.md
echo "" >> $1.md
grep $(cat $1 | sed -n 2p) todot.txt  | sed 's/^/- /' >> $1.md
echo "" >> $1.md

echo "" >> $1.md
echo "## $(cat $1 | sed -n 3p)" >> $1.md
echo "" >> $1.md
grep $(cat $1 | sed -n 3p) todot.txt  | sed 's/^/- /' >> $1.md
echo "" >> $1.md


taskell $1.md


cat $1.md | sed s'|- ||'g | grep -v "^##" | grep . > todo1.txt
cat todor.txt >> todo1.txt



