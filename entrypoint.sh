#!/bin/bash

set -e

INSTALL_DIR="/l4d2"
echo "📦 Actualizando servidor de Left 4 Dead 2..."
/steamcmd/steamcmd.sh +@sSteamCmdForcePlatformType windows \
  +force_install_dir "$INSTALL_DIR" \
  +login "$STEAM_USER" "$STEAM_PASS" \
  +app_update 222860 \
  +@sSteamCmdForcePlatformType linux \
  +app_update 222860 validate \
  +quit

# echo "🔍 Verificando si srcds.exe fue descargado..."
# if [ ! -f "$INSTALL_DIR/srcds.exe" ]; then
#   echo "❌ ERROR: No se descargó srcds.exe. Algo salió mal con SteamCMD."
#   ls -l "$INSTALL_DIR"
#   exit 1
# fi

echo "🚀 Iniciando servidor..."
#exec "$INSTALL_DIR/srcds_run" -game left4dead2 +map c1m1_hotel -maxplayers 8 -secure server.cfg
exec "$INSTALL_DIR/srcds_run" -game left4dead2 -console -usercon -usercon +map c8m1_apartment +maxplayers 8 +exec server.cfg +heartbeat

