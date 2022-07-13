#!/bin/sh

# chamar este script passando como parametro o numero de processos ao mesmo tempo

for i in $(seq $1);
do  
    ./prog a &
    #echo $i
done

wait

