MLL_DIR=minimal/src
KERNEL_DIR=linux-5.13.12

all: help

# roda os scripts originais para construir a ISO
first:
	cd $(MLL_DIR) ; sh build_minimal_linux_live.sh

# make para atualizar o kernel
kernel:
	cd $(MLL_DIR) ; sh update_02_build_kernel.sh 

# make em todos os componentes do SO, nunca use antes do target first
update:
	cd $(MLL_DIR) ; sh update_build.sh

# executa o sistema apos a compilaçao
run:
	qemu-system-x86_64 -kernel $(KERNEL_DIR)/arch/x86/boot/bzImage -initrd $(MLL_DIR)/work/rootfs.cpio.xz -append "init=/bin/sh" -nographic -append "console=ttyS0"

cleanmll:
	cd $(MLL_DIR) ; sh 00_clean.sh # limpando MLL

cleankernel:
	cd $(KERNEL_DIR) ; make clean # limpando o kernel

help:
	@echo "\n\tProjeto de SO - Modificar o kernel do linux"
	@echo ""
	@echo "\tLista de targets:"
	@echo "\tfirst: Realiza a compilaçao do kernel na ISO segundo os scripts do MLL (minimal linux) a partir do zero\n\tlento, utilizar o minimo de vezes possivel\n\tse tudo ocorrer bem, a ISO eh copiada para o root do projeto\n\tpastas afetadas: TP-SO-UFMG/linux-5.13.12 ; TP-SO-UFMG/minimal/src/{<todas>}\n"
	@echo "\tkernel: Realiza a compilaçao apenas do kernel"
	@echo "\trun: Executa o sistema no terminal com o qemu usando o kernel e o rootfs separadamente\n"
	@echo "\tupdate: Apenas atualiza o sistema, mas compila toda libc, demora uns 10 min\n"
	@echo "\tcleanmll: Remove tudo feito na parte do MLL\n "
	@echo "\tcleankernel: 'make clean' na pasta do kernel\n"




