$USER = "$env:username"
$PATH_STORED = "/Users/$USER/AppData/computer_info.txt"

systeminfo | Out-File -FilePath "/Users/$USER/AppData/computer_info.txt"
echo "`n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> $PATH_STORED

ipconfig /all >> $PATH_STORED
echo "`n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> $PATH_STORED

Get-NetNeighbor >> $PATH_STORED
echo "`n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> $PATH_STORED

arp -a >> $PATH_STORED
echo "`n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> $PATH_STORED

route print >> $PATH_STORED
echo "`n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> $PATH_STORED