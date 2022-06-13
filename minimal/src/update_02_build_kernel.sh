#!/bin/sh

set -e

# Load common properties and functions in the current script.
. ./common.sh

echo "*** BUILD KERNEL BEGIN ***"

# Change to the kernel source directory which ls finds, e.g. 'linux-4.4.6'.
cd `ls -d $WORK_DIR/kernel/linux-*`

# Cleans up the kernel sources, including configuration files.
echo "Preparing kernel work area."
#make mrproper -j $NUM_JOBS

# Read the 'USE_PREDEFINED_KERNEL_CONFIG' property from '.config'
USE_PREDEFINED_KERNEL_CONFIG=`read_property USE_PREDEFINED_KERNEL_CONFIG`
BUILD_KERNEL_MODULES=`read_property BUILD_KERNEL_MODULES`


# Compile the kernel with optimization for 'parallel jobs' = 'number of processors'.
# Good explanation of the different kernels:
# http://unix.stackexchange.com/questions/5518/what-is-the-difference-between-the-following-kernel-makefile-terms-vmlinux-vmlinux
echo "Building kernel."
make \
  CFLAGS="$CFLAGS" \
  bzImage -j $NUM_JOBS

if [ "$BUILD_KERNEL_MODULES" = "true" ] ; then
  echo "Building kernel modules."
  make \
    CFLAGS="$CFLAGS" \
    modules -j $NUM_JOBS
fi

# Prepare the kernel install area.
echo "Removing old kernel artifacts. This may take a while."
rm -rf $KERNEL_INSTALLED
mkdir $KERNEL_INSTALLED

echo "Installing the kernel."
# Install the kernel file.
cp arch/x86/boot/bzImage \
  $KERNEL_INSTALLED/kernel

if [ "$BUILD_KERNEL_MODULES" = "true" ] ; then
  make INSTALL_MOD_PATH=$KERNEL_INSTALLED \
    modules_install -j $NUM_JOBS
fi

# Install kernel headers which are used later when we build and configure the
# GNU C library (glibc).
echo "Generating kernel headers."
make \
  INSTALL_HDR_PATH=$KERNEL_INSTALLED \
  headers_install -j $NUM_JOBS

cd $SRC_DIR

echo "*** BUILD KERNEL END ***"
