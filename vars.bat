:: Installation directory for virtual box
set VBOX=C:\Program Files\Oracle\VirtualBox

:: Location where the VM should be created
set VBOX_HOME=c:\Virtual Box

:: Name of the VM
set NAME=centos65-x86_64-minimal

:: Guest OS type
set TYPE=RedHat_64

:: OS installation media
set INSTALLER=%VBOX_HOME%\CentOS-6.5-x86_64-bin-DVD1.iso

:: Location of guest additions iso
set GUESTADDITIONS=%VBOX%\VBoxGuestAdditions.iso

:: Name of the primary disk
set HDD=%VBOX_HOME%\%NAME%\main.vdi

:: Size of primary disk in MB (dynamic allocation)
set HDD_SIZE=30720

:: Name of the swap disk 
set HDD_SWAP=%VBOX_HOME%\%NAME%\swap.vdi

:: Size of swap disk in MB - should be twice the size of max memory (dynamic allocation)
set HDD_SWAP_SIZE=4096

:: Intial memory allocation in MB
set MEMORY=613

:: Not sure what this is for...
set NATNET=10.0.2.0/24
