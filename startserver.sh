#! /bin/bash

set -xe

DEFAULT_STEAMAPPS="$HOME/Steam/steamapps"

# Link steamapps folder in home directory to mod folder. This will be used
# by the automatic mod management of the server app
mkdir -p /ark/server/steamapps
if [ ! -d "$DEFAULT_STEAMAPPS" ]; then
    ln -s /ark/server/steamapps "$DEFAULT_STEAMAPPS"
fi

cd server/ShooterGame/Binaries/Linux \
    && ./ShooterGameServer \
    "CrystalIsles?listen?SessionName=Arkkkk?ServerPassword=pandemic?ServerAdminPassword=gamergirlbathwater?Port=7777?QueryPort=27015?MaxPlayers=20?RCONEnabled=true" \
    -NoBattlEye -server -servergamelog -automanagedmods -structurememopts
