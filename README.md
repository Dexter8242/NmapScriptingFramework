# Nmap Scripting Framework (NSF)
## Introduction
Nmap Scripting Framwork is a simple tool for using nmap, you can search for scripts (including filtering output), run scripts, and scan targets.

## Installation 
To install the script:
1. `cd /tmp`
2. `git clone https://github.com/Dexter8242/NmapScriptingFramework.git`
3. `cd NmapScriptingFramework`
4. `sha256sum nsf`

Checksum should match `e15a221661122e3a89bcf4eb3e217b520354efd30b25c8467bc9fdbcbf1541b8`

If checksum matches, proceed to step 5.

5. `sudo mv nsf /usr/bin`

## Usage
### Scanning a target
To scan a target with default flags (--open, -sV, --top-ports 1024):
`nsf scan <TARGET IP>`

To scan a target with added flags:
`nsf scan <TARGET IP> <FLAGS>`

### Listing nmap scripts 
To show all available scripts:
`nsf print`

To filter the output of available scripts:
`nsf print <string to search for>`

### Running scripts
To run a script:
`nsf script <name of script>`
For example:
`nsf script http-enum.nse`
