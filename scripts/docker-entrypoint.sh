#!/bin/sh -e

echo "=====> Checking the latest stable release of factorio..."
./download-latest.sh
echo "=====> Checking for folders and savegame"
./check-folders.sh
echo "=====> Ready to start the server"

exec "$@"
