#!/bin/sh -e

if [ ! -d "mods" ]; then
  echo "===> mods folder does not exist, creating now..."
  mkdir -p mods
fi

if [ ! -d "config" ]; then
  echo "===> config folder does not exist, creating now..."
  mkdir -p config
  cp templates/config.ini config/config.ini
  cp templates/server-adminlist.json server-adminlist.json
fi

if [ ! -d "saves" ]; then
  echo "===> saves folder does not exist, creating now..."
  mkdir -p saves
  echo "===> save.zip does not exist, creating now..."
  ./bin/x64/factorio \
    --mod-directory mods \
    --create saves/save.zip \
    --map-gen-settings templates/map-gen-settings.json \
    --map-settings templates/map-settings.json
fi

if [ ! -d "script-output" ]; then
  echo "===> script-output folder does not exist, creating now..."
  mkdir -p script-output
fi

if [ ! -d "scenarios" ]; then
  echo "===> scenarios folder does not exist, creating now..."
  mkdir -p scenarios
fi
