#!/bin/sh

set -e

# Load common properties and functions in the current script.
. ./common.sh

echo "*** BUILD GLIBC BEGIN ***"

# Find the glibc source directory, e.g. 'glibc-2.23' and remember it.
GLIBC_SRC=`ls -d $WORK_DIR/glibc/glibc-*`

# All glibc work is done from the working area.
cd $GLIBC_OBJECTS


# Compile glibc with optimization for "parallel jobs" = "number of processors".
echo "Building glibc."
make -j $NUM_JOBS

# Install glibc in the installation area, e.g. 'work/glibc/glibc_installed'.
echo "Installing glibc."
make install \
  DESTDIR=$GLIBC_INSTALLED \
  -j $NUM_JOBS

cd $SRC_DIR

echo "*** BUILD GLIBC END ***"
