#!/bin/bash
echo "[*] Recompiling APK..."
apktool b insta_src -o mod_instagram-unsigned.apk

echo "[*] Signing APK with custom release keystore..."
jarsigner -verbose -sigalg SHA256withRSA -digestalg SHA-256 \
  -keystore my-release-key.jks \
  -storepass myStrongPass123 \
  -keypass myStrongPass123 \
  mod_instagram-unsigned.apk my_alias

mv mod_instagram-unsigned.apk mod_instagram.apk
echo "[+] Signed APK: mod_instagram.apk"
