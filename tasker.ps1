mkdir C:\Sophos
iwr -Uri "https://raw.githubusercontent.com/orion47/test0/main/sophos.xml" -OutFile "C:\Sophos\sophos.xml"
iwr -Uri "https://raw.githubusercontent.com/orion47/test0/main/vpn-connect.bat" -OutFile "C:\Sophos\vpn-connect.bat"
Register-ScheduledTask -Xml (Get-Content ("C:\Sophos\sophos.xml") | Out-String ) -TaskName "sophos"
