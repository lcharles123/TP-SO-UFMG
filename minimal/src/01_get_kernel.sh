#!/bin/sh

set -e

# Load common properties and functions in the current script.
. ./common.sh

echo "*** GET KERNEL BEGIN ***"

# Read the 'KERNEL_SOURCE_URL' property from '.config'.
#DOWNLOAD_URL=`read_property KERNEL_SOURCE_URL`

#svn checkout https://github.com/lcharles123/TP-SO-UFMG/trunk/linux-5.13.12 $WORK_DIR/kernel/linux-5.13.12
#basta um softlink para o repositorio
mkdir -p $WORK_DIR/kernel/
ln -s $SRC_DIR/../../linux-5.13.12 $WORK_DIR/kernel/linux-5.13.12
# Extract the kernel sources in the 'work/kernel' directory.
#extract_source $SOURCE_DIR/$ARCHIVE_FILE kernel

# We go back to the main MLL source folder.
cd $SRC_DIR

echo "*** GET KERNEL END ***"
