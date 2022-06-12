MLL_DIR=minimal/src

all: kernel_only

first:
	cd $(MLL_DIR) ; sh build_minimal_linux_live.sh

kernel:
	cd $(MLL_DIR) ; sh 02_build_kernel.sh

checkout:
	cd $(MLL_DIR) ; sh 01_get_kernel.sh

cleanmll:
	cd $(MLL_DIR) ; sh 00_clean.sh # limpando MLL

cleankernel:
	cd linux-5.13.12 ; make clean # limpando as modificacoes no kernel

help:
	@echo "\tProjeto de SO - Modificar o kernel do linux"
	@echo ""
	@echo "\tLista de targets:"
	@echo "\tfirst: Realiza a compilaçao do kernel na ISO segundo os scripts do MLL (minimal linux), a ISO eh copiada para o root do projeto"
	@echo "\tkernel: Realiza apenas a compilaçao do kernel e atualiza a ISO"
	@echo "\tclean: Remove as pastas: "




