#!/bin/bash

cowsay "Looking for some open directories today?"
echo "[?] How many random hosts do you want to scan?"
read hostnum
echo "[*] Running Nmap scan on $hostnum random IPs, please wait..."
sudo nmap -iR $hostnum -p445 -Pn --open -n -T5 | grep "Nmap scan report for" | awk -F " " '{print $5}' > hosts.txt
discovered=$(cat hosts.txt | wc -l)
if [ "$discovered" -eq 0 ]; then
    echo "[!] Sorry, no hosts found running SMB, exiting."
    exit 0
else
    echo "[*] We found $discovered hosts running SMB"
    cat hosts.txt
    echo "[*] Here are the associated pointer records (if available.)"
    cat hosts.txt | xargs -I {} nslookup {} | grep "name = "
    echo "[?] Do you want to run SMBMap on the discovered hosts?"
    read smbmapyesno
    if [ "$smbmapyesno" = "y" ]; then
        echo "[*] Running SMBMap, attempting to connect with anonymous access."
        smbmap -u anonymous -d workgroup --host-file hosts.txt --no-pass --no-banner
    else
        echo "[!] Exiting"
        exit 0
    fi
fi
