#!/bin/bash
python3 download_apk.py
bash decompile.sh
python3 patch_smali.py
python3 add_features.py
bash recompile_sign.sh
