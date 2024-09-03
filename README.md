# SMB Search Wrapper
![smbwrap](https://github.com/user-attachments/assets/b2c3b6a0-b7ae-4357-8626-1f4747219255)
### What is it?
This is just a simple shell script that uses Nmap and SMBmap to randomly scan the desired number of IP addresses for open SMB ports. If an open SMB port is discovered by Nmap it is added to a list. Once all random IPs have been scanned their pointer records are displayed (if available) and the user may then run SMBmap on each discovered host to check for anonymous access.

### Prerequisites
* Nmap (for finding hosts)
* SMBmap (for authentication to SMB servers)
* Cowsay (for cuteness)

### Usage
Just launch the script and give it a number of random IPs!

### Notes
Don't be dumb, this uses the T5 timing template for Nmap. Check the pointer records, know the laws in your country.

