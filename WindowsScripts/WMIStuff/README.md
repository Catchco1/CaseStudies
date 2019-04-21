#WMI

This information was used in the 2018 presentation at BSides Charm, and is also to be used in 2019 Towson Case Studies in Computer Science course.

There are 3 Managed Object Format (MOF) files. 

Log.mof is set up to log every time PowerShell is run to a file on the Desktop.

FunDeath.mof will kill Process Explorer (from Windows Sysinternals) whenever it is launched, as well as begin playing a song stored on the computer.

ptest.mof was an example to establish malware persistence using the WMI database. 

All of these files are installed using the following commmand:

`mofcomp <filename>`

This command can be run by both Administrators and the SYSTEM user. 