This package is based on http://download.uib.de/opsi_stable/products/contribute/template/office2010proplus_14-17.opsi

It fixes the issue with Office x64 not auto-activating, as well as some minor typos.

This currently only installs the German ("de") edition of Office 2010, as we are lacking the checksums for other languages.

The content of the 32-bit installation DVD goes here: CLIENT_DATA/files/de/x86

The content of the 64-bit installation DVD goes here: CLIENT_DATA/files/de/x64

If your md5deep check fails, make sure you have slipstreamed Office 2010 Service Pack 2.

Office 2010 Service Pack 2 is required for the UIB office_2010_hotfix package to work.

These service packs can be downloaded here:

https://download.microsoft.com/download/A/7/5/A75DC999-3AF8-4562-8E10-25C8FECD3D7B/officesp2010-kb2687455-fullfile-x64-de-de.exe

https://download.microsoft.com/download/6/2/F/62FA5A81-8D8B-43C4-B089-8FB88FF6F94F/officesp2010-kb2687455-fullfile-x86-de-de.exe

To perform the slipstreaming operation, you need a Windows machine.

Run each of those executables with command line parameter /extract:\<somedir\>-x[86|64]

After the extraction is complete, copy the contents of 

\<somedir\>-x86 to CLIENT_DATA/files/de/x86/Updates 

\<somedir\>-x64 to CLIENT_DATA/files/de/x64/Updates 
