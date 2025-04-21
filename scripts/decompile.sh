#!/bin/bash
echo "[*] Decompiling APK..."
apktool d instagram_alpha.apk -o insta_src -f
echo "[+] Done!"
