MLL_DIR=minimal/src
KERNEL_DIR=linux-5.13.12

all: help

first:
	cd $(MLL_DIR) ; sh build_minimal_linux_live.sh

kernel:
	cd $(MLL_DIR) ; sh update_02_build_kernel.sh 

update:
	cd $(MLL_DIR) ; sh update_build.sh

cleanmll:
	cd $(MLL_DIR) ; sh 00_clean.sh # limpando MLL

cleankernel:
	cd $(KERNEL_DIR) ; make clean # limpando as modificacoes no kernel

help:
	@echo "\n\tProjeto de SO - Modificar o kernel do linux"
	@echo ""
	@echo "\tLista de targets:"
	@echo "\tfirst: Realiza a compilaçao do kernel na ISO segundo os scripts do MLL (minimal linux) a partir do zero\n\tlento, utilizar o minimo de vezes possivel\n\tse tudo ocorrer bem, a ISO eh copiada para o root do projeto\n\tpastas afetadas: TP-SO-UFMG/linux-5.13.12 ; TP-SO-UFMG/minimal/src/{<todas>}\n"
	@echo "\tkernel: Realiza apenas a compilaçao do kernel e atualiza a ISO\n"
	@echo "\tcleanmll: Remove tudo feito na parte do MLL\n "
	@echo "\tcleankernel: 'make clean' na pasta do kernel\n"




