call vars.bat

"%VBOX%\VBoxManage" createvm --name %NAME% --ostype %TYPE% --register

"%VBOX%\VBoxManage" modifyvm %NAME% ^
    --vram 12 ^
    --accelerate3d off ^
    --memory %MEMORY% ^
    --usb off ^
    --audio none ^
    --boot1 disk --boot2 dvd --boot3 none --boot4 none ^
    --nictype1 virtio --nic1 nat --natnet1 "%NATNET%" ^
    --nictype2 virtio ^
    --nictype3 virtio ^
    --nictype4 virtio ^
    --acpi on --ioapic off ^
    --chipset piix3 ^
    --rtcuseutc on ^
    --hpet on ^
    --bioslogofadein off ^
    --bioslogofadeout off ^
    --bioslogodisplaytime 0 ^
    --biosbootmenu disabled

"%VBOX%\VBoxManage" createhd --filename "%HDD%" --size %HDD_SIZE%
"%VBOX%\VBoxManage" createhd --filename "%HDD_SWAP%" --size %HDD_SWAP_SIZE%

"%VBOX%\VBoxManage" storagectl %NAME% ^
    --name SATA --add sata --portcount 2 --bootable on

"%VBOX%\VBoxManage" storageattach %NAME% ^
    --storagectl SATA --port 0 --type hdd --medium "%HDD%"
"%VBOX%\VBoxManage" storageattach %NAME% ^
    --storagectl SATA --port 1 --type hdd --medium "%HDD_SWAP%"
"%VBOX%\VBoxManage" storageattach %NAME% ^
    --storagectl SATA --port 2 --type dvddrive --medium "%INSTALLER%"
"%VBOX%\VBoxManage" storageattach %NAME% ^
    --storagectl SATA --port 3 --type dvddrive --medium "%GUESTADDITIONS%"

"%VBOX%\VBoxManage" startvm %NAME% --type gui

mkdir boxes

echo 'At the boot prompt, hit <TAB> and then type:'
:: echo " ks=http://${IP}.3:8081"
echo " ks=http://<host ip>:8080/ks.cfg"
:: sh ./httpd.sh | nc -l 8081 >/dev/null
mongoose

:: # This only really caters for the common case. If you have problems, please
:: # discover your host's IP address and adjust accordingly.
:: IP=`echo ${NATNET} | sed -nE 's/^([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}).*/\1/p'`

echo When finished:
echo "cleanup"
echo "vagrant package --base %NAME% --output boxes\%NAME%.box"
