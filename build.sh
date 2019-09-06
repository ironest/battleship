#!/usr/bin/env sh

echo "Start building"

if [ -d "./dist" ]
then
    TODAY=$(date +%Y%m%d_%H%M%S)
    BCK_FOLDER="dist_backup_"$TODAY
    echo "Backing up existing files to" $BCK_FOLDER
    mv ./dist ./$BCK_FOLDER
fi

echo "Building app..."

mkdir dist
cp index.rb \
   ./dist/

mkdir dist/files
cp files/graphic.rb \
   files/util.rb \
   ./dist/files/

echo "Done"