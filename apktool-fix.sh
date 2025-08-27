#!/bin/bash
# Fix for broken apktool package on Kali Linux
# This script removes the buggy repo version and installs the latest release
# directly from the official iBotPeaches source.

set -euo pipefail
VERSION="2.9.3"   # Change this if a newer version is out
URL="https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_${VERSION}.jar"
WRAPPER="https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool"

echo "[*] Removing old apktool package..."
sudo apt remove --purge -y apktool || true

echo "[*] Downloading apktool wrapper..."
wget -q -O apktool "$WRAPPER"
chmod +x apktool

echo "[*] Downloading apktool v$VERSION..."
wget -q -O apktool.jar "$URL"

echo "[*] Installing apktool to /usr/local/bin..."
sudo mv apktool /usr/local/bin/
sudo mv apktool.jar /usr/local/bin/apktool.jar
sudo chmod 755 /usr/local/bin/apktool
sudo chmod 644 /usr/local/bin/apktool.jar

echo "[*] Preventing Kali from overwriting apktool..."
sudo apt-mark hold apktool

echo "[+] Done. Installed apktool version:"
apktool -version
