#!/bin/sh

# param = numero de programas ao mesmo tempo

for t in $(seq $1) ;
do  
    #sleep 1
    ./iterative.sh 3 &
done

wait

