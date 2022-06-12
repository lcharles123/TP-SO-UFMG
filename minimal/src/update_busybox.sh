#!/bin/sh

set -e

# Load common properties and functions in the current script.
. ./common.sh

echo "*** BUILD BUSYBOX BEGIN ***"

# Change to the source directory ls finds, e.g. 'busybox-1.24.2'.
cd `ls -d $WORK_DIR/busybox/busybox-*`

# Compile busybox with optimization for "parallel jobs" = "number of processors".
echo "Building Busybox."
make \
  busybox -j $NUM_JOBS

# Create the symlinks for busybox. The file 'busybox.links' is used for this.
echo "Generating Busybox based initramfs area."
make \
  CONFIG_PREFIX="$BUSYBOX_INSTALLED" \
  install -j $NUM_JOBS

cd $SRC_DIR

echo "*** BUILD BUSYBOX END ***"
