Please add your Name and E-Mail address, as well as the name of the openvpn
OPSI package you intend to use, to the Makefile.
Also, place all (*.ovpn,...) files that you want to end up in
one package (one package can contain more than one file)
in a subdirectory under ./configs/
If you want a "one package to rule them all" approach,
create a single subdirectory
./configs/YOURORGANIZATION/
and place all your files in that subdirectory
