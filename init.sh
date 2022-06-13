#!/bin/sh

# System initialization sequence:
#
# /init (this file)
#  |
#  +--(1) /etc/01_prepare.sh
#  |
#  +--(2) /etc/02_overlay.sh
#          |
#          +-- /etc/03_init.sh
#               |
#               +-- /sbin/init
#                    |
#                    +--(1) /etc/04_bootscript.sh
#                    |       |
#                    |       +-- /etc/autorun/* (all scripts)
#                    |
#                    +--(2) /bin/sh (Alt + F1, main console)
#                    |
#                    +--(2) /bin/sh (Alt + F2)
#                    |
#                    +--(2) /bin/sh (Alt + F3)
#                    |
#                    +--(2) /bin/sh (Alt + F4)

echo -e "Welcome to \\e[1mMinimal \\e[32mLinux \\e[31mLive\\e[0m (/init)"
echo lalala
# Let's mount all core file systems.
/etc/01_prepare.sh

# Print first message on screen.
cat /etc/msg/init_01.txt

# Wait 5 second or until any ~keyboard key is pressed.
read -t 5 -n1 -s key

if [ ! "$key" = "" ] ; then
  # Print second message on screen.
  cat /etc/msg/init_02.txt

  # Set flag which indicates that we have obtained controlling terminal.
  export PID1_SHELL=true

  # Interactive shell with controlling tty as PID 1.
  exec setsid cttyhack sh
fi

# Create new mountpoint in RAM, make it our new root location and overlay it
# with our storage area (if overlay area exists at all). This operation invokes
# the script '/etc/03_init.sh' as the new init process.
exec /etc/02_overlay.sh

echo "(/init) - you can never see this unless there is a serious bug."

# Wait until any key has been pressed.
read -n1 -s
