import requests
import re
import os
from bs4 import BeautifulSoup

APK_PAGE = "https://www.apkmirror.com/uploads/?q=instagram-alpha"

def get_latest_download_link():
    print("[*] Fetching latest APK...")
    res = requests.get(APK_PAGE)
    soup = BeautifulSoup(res.text, 'html.parser')
    links = soup.find_all('a', href=True)

    for link in links:
        if "instagram-alpha" in link['href'] and "arm64-v8a" in link['href']:
            detail_page = "https://www.apkmirror.com" + link['href']
            break

    print("[*] Getting detail page:", detail_page)
    res = requests.get(detail_page)
    soup = BeautifulSoup(res.text, 'html.parser')
    buttons = soup.select('a.accent_bg.btn')

    for button in buttons:
        if 'Download APK' in button.text:
            apk_link = "https://www.apkmirror.com" + button['href']
            break

    print("[*] Final download page:", apk_link)
    res = requests.get(apk_link, allow_redirects=True)
    soup = BeautifulSoup(res.text, 'html.parser')
    download_button = soup.select_one('a#downloadButton')
    final_link = download_button['href']

    print("[*] Downloading APK...")
    apk_data = requests.get(final_link).content
    with open("instagram_alpha.apk", "wb") as f:
        f.write(apk_data)

    print("[+] APK downloaded: instagram_alpha.apk")

if __name__ == "__main__":
    get_latest_download_link()
