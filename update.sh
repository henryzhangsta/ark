#!/bin/bash

set -xe

ARK_STEAMCMD_BIN="/ark/server/Engine/Binaries/ThirdParty/SteamCMD/Linux"
STEAM_CMD="$ARK_STEAMCMD_BIN/steamcmd.sh"

DEFAULT_STEAMAPPS="$HOME/Steam/steamapps"

# Download SteamCMD if needed
if [ ! -f "$STEAM_CMD" ]; then
    mkdir -p $ARK_STEAMCMD_BIN \
        && curl -sqL https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz \
        | tar zxf - -C $ARK_STEAMCMD_BIN
fi

# Link steamapps folder in home directory to mod folder. This will be used
# by the automatic mod management of the server app
mkdir -p /ark/server/steamapps
if [ ! -d "$DEFAULT_STEAMAPPS" ]; then
    ln -s /ark/server/steamapps "$DEFAULT_STEAMAPPS"
fi

$STEAM_CMD +login anonymous +force_install_dir /ark/server +app_update 376030 +quit

# Link steamapps folder in server SteamCMD to mod folder
if [ ! -d "$ARK_STEAMCMD_BIN/steamapps" ]; then
    (cd $ARK_STEAMCMD_BIN && ln -s ../../../../../steamapps steamapps)
fi
