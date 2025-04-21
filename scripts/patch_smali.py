import os

TARGET_FILE = "insta_src/smali_classes1/com/instagram/common/session/UserSession.smali"

def patch_smali():
    print("[*] Patching smali...")
    if not os.path.exists(TARGET_FILE):
        print("[-] Target file not found!")
        return

    with open(TARGET_FILE, "r") as file:
        lines = file.readlines()

    patched_lines = []
    patched = False
    for line in lines:
        patched_lines.append(line)
        if 'move-result v0' in line and not patched:
            patched_lines.append('    const v0, 0x1\n')
            patched = True

    with open(TARGET_FILE, "w") as file:
        file.writelines(patched_lines)

    print("[+] Patch complete.")

if __name__ == "__main__":
    patch_smali()
