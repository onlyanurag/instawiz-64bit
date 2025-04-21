#!/bin/bash
echo "[*] Recompiling APK..."
apktool b insta_src -o mod_instagram_unsigned.apk

echo "[*] Decoding keystore from secret..."
echo "${KEYSTORE_BASE64}" | base64 -d > my-release-key.jks

echo "[*] Signing APK..."
jarsigner -verbose -sigalg SHA256withRSA -digestalg SHA-256 \
  -keystore my-release-key.jks \
  -storepass "${KEYSTORE_PASSWORD}" \
  -keypass "${KEY_ALIAS_PASSWORD}" \
  mod_instagram_unsigned.apk "${KEY_ALIAS}"

mv mod_instagram_unsigned.apk mod_instagram.apk
echo "[+] Signed: mod_instagram.apk"
