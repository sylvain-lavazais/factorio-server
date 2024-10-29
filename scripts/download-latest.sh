#!/bin/sh -e

current_version="$(curl -s https://factorio.com/api/latest-releases | jq -r .stable.headless)"

if [ -s version.txt ]; then
  dl_version="$(cat version.txt)"
else
  dl_version=""
fi

if [ "$current_version" != "$dl_version" ]; then
  echo "===> Downloading stable release : $current_version"
  rm -rf factorio
  curl -L \
    --url https://factorio.com/get-download/"$current_version"/headless/linux64 \
    > ./factorio.tar.xz && \
  tar -xf factorio.tar.xz && \
  rm -rf factorio.tar.xz && \
  echo "$current_version" > version.txt
  echo "===> moving factorio folder"
  mv factorio/bin ./bin
  mv factorio/data ./data
  mv factorio/config-path.cfg .
  rm -rf factorio
fi
