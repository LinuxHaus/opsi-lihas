How to get the neccessary files: 
VeraCrypt does not allow the extraction of the required files directly from 
an installer archive.  Instead, you need to download the VeraCrypt installer 
from: 
http://download-codeplex.sec.s-msft.com/Download/Release?ProjectName=veracrypt&DownloadId=1468023&FileTime=130886989024330000&Build=21031
and select "extract" after running the installer on a Windows machine.

Ignore all the warnings about how portable mode does not allow full disk
encryption, needs admin rights here and there, blah blah blah.  We know what
we are doing.

Then, copy the content of the destination directory \VeraCrypt\*.* on the 
Windows machine to the directory veracrypt-full-lihas/CLIENT_DATA/files/ of your
build environment.

Important: If you set up System Partition Encryption or Full Disk Encryption
*in a virtual machine*, expect bootup times of 1 hour and above - the issue 
seems to be with file system snapshots (especially LVM2)  on the host.  If you 
don't use a snapshot for the particular VM, you should see normal bootup times.
