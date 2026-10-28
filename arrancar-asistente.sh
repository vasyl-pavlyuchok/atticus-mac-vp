#!/bin/bash
# AG46: arranca assistantd y Siri.agent en la sesion actual, sin cerrar sesion ni tocar otros procesos (la subida a Drive sigue).
# Reversible: launchctl bootout gui/$(id -u)/com.apple.assistantd  (y lo mismo con com.apple.Siri.agent)
U=$(id -u)
for s in com.apple.assistantd com.apple.Siri.agent; do
  launchctl bootstrap "gui/$U" "/System/Library/LaunchAgents/$s.plist" 2>&1 || true
done
sleep 2
launchctl print "gui/$U/com.apple.assistantd" 2>&1 | grep -E 'state|Could not' | head -2
echo "Listo. Cierra y abre Atticus (menu de Atticus -> Quit) y prueba."
