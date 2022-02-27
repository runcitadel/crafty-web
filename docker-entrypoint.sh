#!/usr/bin env bash

# Download the latest minecraft vanilla server to /servers/vanilla.jar
wget -O /servers/vanilla.jar https://launcher.mojang.com/v1/objects/125e5adf40c659fd3bce3e66e67a16bb49ecc1b9/server.jar

# Download spigot too
wget -O /servers/spigot.jar https://download.getbukkit.org/spigot/spigot-1.18.1.jar

echo "eula=true" > /servers/eula.txt

python3 crafty.py -c /crafty_web/configs/docker_config.yml
