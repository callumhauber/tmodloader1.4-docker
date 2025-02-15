#!/usr/bin/env bash

VERSION=2022.09.47.4

if [ -e ModPacks/*/Mods/enabled.json ]; then
  ./startserver.sh
else
  if [ ! -d "Libraries/" ]; then
    echo "No server files detected. Installing..."
    curl -LO https://github.com/tModLoader/tModLoader/releases/download/v${VERSION}/tModLoader.zip
    unzip -o tModLoader.zip
    rm -r tModLoader.zip

    curl -LO https://github.com/callumhauber/tmodloader1.4-docker/releases/download/v1.0.3/tmodloader1.4-docker-master.zip
    unzip -o tmodloader1.4-docker-master.zip
    rm -r tmodloader1.4-docker-master.zip
    mkdir ModPacks/
    mkdir Worlds/
    chmod +x startserver.sh
    chmod +x start-tModLoaderServer.sh
    echo "Server setup complete"
  fi
  echo "No modpack detected. Add your modpack to ModPacks/ and restart. Don't forget to edit your serverconfig.txt"
  exit
fi
