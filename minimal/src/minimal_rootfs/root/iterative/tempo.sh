#!/bin/sh

# chamar este script passando a linha executavel como argumento

TEMPO=$(time -f "%e %U %S" ./batch_exec.sh 10 2>&1)
calc() # sh does't support arrays, but can unpack by fun args
{ 
    # (tempo_real * threads_usadas) - (temp_user + temp_sys)
    REAL=$1; USER_=$2; SYS=$3; 
    TEMPO_ESPERA=$(echo "($1 * 1) - ($2 + $3)" | bc)
}
calc $TEMPO

echo "Tempo de espera: "$TEMPO_ESPERA
echo "Tempo total: "$REAL

#time -f "%e" sleep 3
# %e elapsed real
# "%c" numero de vezes troca de contexto
# %S seconds in kernel mode
# %U second in user mode
# %P (user + system) / real
