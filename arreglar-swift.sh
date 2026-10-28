#!/bin/bash
# AG46: las Command Line Tools 16.2 traen SwiftBridging duplicado y ningun programa Swift con AppKit compila
# (ni un «hola mundo»). Se aparta, sin borrar, el modulemap duplicado. Para deshacer: ver la ultima linea.
set -e
F=/Library/Developer/CommandLineTools/usr/include/swift/module.modulemap
if [ ! -f "$F" ]; then echo "No existe $F: nada que hacer."; exit 0; fi
sudo mv "$F" "$F.bak-tb"
echo "Hecho: $F apartado como $F.bak-tb"
echo "Para deshacer: sudo mv $F.bak-tb $F"
