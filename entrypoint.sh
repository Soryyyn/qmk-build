#!/bin/sh -l

KEYMAP_PATH=$1
KEYBOARD=$2
KEYMAP=$3

ln -s "$PWD/$KEYMAP_PATH" "/qmk_firmware/$KEYMAP_PATH"
qmk compile -kb "$KEYBOARD" -km "$KEYMAP"
rm -rf build
mkdir ./build
find /qmk_firmware/.build -type f \( -name "*.hex" -o -name "*.bin" -o -name "*.uf2" \) -exec cp {} ./build \;
