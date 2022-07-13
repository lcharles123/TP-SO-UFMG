#!/bin/sh

# chamar com o numero de iteraçoes como parametro

ITERATIONS=0
for j in $(seq $1) ;
do
    if [ $(($RANDOM % 10)) > 2 ] ;
    then 
        echo 123 > arq.txt
        tail arq.txt >> arq2.txt
        head arq.txt >> arq3.txt
        rm arq3.txt 
    else
        for i in $(seq 999);
        do
            A=$(echo "2+4*23413432*324324" | bc )
        done
    fi
    ITERATIONS=$((ITERATIONS+1))  
done
rm -rf arq*
echo "iters: "$ITERATIONS 



