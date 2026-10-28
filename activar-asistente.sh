#!/bin/bash
# AG46: en este Mac estan desactivados com.apple.assistantd y com.apple.Siri.agent (launchd). Sin assistantd
# no existe el servicio com.apple.assistant.dictation: el Dictado no se puede activar y Atticus no oye.
# Se reactivan (reversible: launchctl disable gui/$(id -u)/<nombre>) y se arrancan.
U=$(id -u)
for s in com.apple.assistantd com.apple.Siri.agent; do
  launchctl enable "gui/$U/$s"
  launchctl kickstart -k "gui/$U/$s" 2>/dev/null || true
done
launchctl print-disabled "gui/$U" | grep -E 'assistantd|Siri.agent' || echo "Ya no aparecen como desactivados."
echo "Listo. Cierra y abre Atticus, y prueba el Dictado en Ajustes."
