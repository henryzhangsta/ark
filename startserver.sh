#! /bin/bash

set -xe

DEFAULT_STEAMAPPS="$HOME/Steam/steamapps"
SAVE_ROOT="/ark/server/ShooterGame/Saved"

# Link steamapps folder in home directory to mod folder. This will be used
# by the automatic mod management of the server app
mkdir -p /ark/server/steamapps
if [ ! -d "$DEFAULT_STEAMAPPS" ]; then
    ln -s /ark/server/steamapps "$DEFAULT_STEAMAPPS"
fi

if [ ! -d "$SAVE_ROOT/Config" ]; then
    ln -s /ark/config "$SAVE_ROOT/Config"
fi

if [ ! -d "$SAVE_ROOT/SavedArks" ]; then
    mkdir -p /ark/save/SavedArks
    ln -s /ark/save/SavedArks "$SAVE_ROOT/SavedArks"
fi

if [ ! -d "$SAVE_ROOT/SaveGames" ]; then
    mkdir -p /ark/save/SaveGames
    ln -s /ark/save/SaveGames "$SAVE_ROOT/SaveGames"
fi

if [ ! -d "$SAVE_ROOT/Logs" ]; then
    mkdir -p /ark/save/Logs
    ln -s /ark/save/Logs "$SAVE_ROOT/Logs"
fi

cd server/ShooterGame/Binaries/Linux \
    && ./ShooterGameServer \
    "$MAP?listen?SessionName=Arkkkk?ServerPassword=pandemic?ServerAdminPassword=gamergirlbathwater?Port=$CLIENT_PORT?QueryPort=$QUERY_PORT?MaxPlayers=10?RCONEnabled=true?ShowFloatingDamageText=true" \
    -NoBattlEye -server -servergamelog -automanagedmods -structurememopts -noantispeedhack -ClusterDirOverride=/ark/cluster -clusterid=cluster1
