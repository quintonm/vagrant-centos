call vars.bat

"%VBOX%\VBoxManage" modifyvm %NAME% ^
    --boot1 disk --boot2 none --boot3 none --boot4 none 

"%VBOX%\VBoxManage" storagectl %NAME% ^
    --name SATA --remove

"%VBOX%\VBoxManage" storagectl %NAME% ^
    --name SATA --add sata --portcount 1 --bootable on

"%VBOX%\VBoxManage" storageattach %NAME% ^
    --storagectl SATA --port 0 --type hdd ^
    --medium "%HDD%"

"%VBOX%\VBoxManage" storageattach %NAME% ^
    --storagectl SATA --port 1 --type hdd ^
    --medium "%HDD_SWAP%"
