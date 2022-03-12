#!/usr/bin/env bash

# Download the latest minecraft vanilla server to /servers/vanilla.jar
wget -O /servers/vanilla.jar https://launcher.mojang.com/v1/objects/c8f83c5655308435b3dcf03c06d9fe8740a77469/server.jar

# Download spigot too
wget -O /servers/spigot.jar https://download.getbukkit.org/spigot/spigot-1.18.2.jar

echo "eula=true" > /servers/eula.txt

python3 crafty.py -c /crafty_web/configs/docker_config.yml
