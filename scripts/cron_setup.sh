#!/bin/bash
SCRIPT_PATH=$(pwd)/run_all.sh
(crontab -l 2>/dev/null; echo "0 2 * * * $SCRIPT_PATH") | crontab -
echo "[+] Daily cron job set at 2:00 AM"
