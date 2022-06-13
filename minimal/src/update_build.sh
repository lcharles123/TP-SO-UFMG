#!/bin/sh

sh update_02_build_kernel.sh 
sh update_04_build_glibc.sh  #necessario recompilar apenas se a interface com o kernel mudar, demora se executar depois do script anterior
sh 05_prepare_sysroot.sh
sh update_busybox.sh
sh 09_generate_rootfs.sh
sh 10_pack_rootfs.sh	
sh 13_prepare_iso.sh	    
sh 14_generate_iso.sh	 

