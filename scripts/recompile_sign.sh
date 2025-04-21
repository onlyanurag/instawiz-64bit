#!/bin/bash
echo "[*] Recompiling APK..."
apktool b insta_src -o mod_instagram.apk

echo "[*] Signing APK..."
# Replace with your keystore details
jarsigner -verbose -sigalg SHA256withRSA -digestalg SHA-256 \
  -keystore my-release-key.jks -storepass yourpass \
  mod_instagram.apk alias_name

echo "[+] Done: mod_instagram.apk"
