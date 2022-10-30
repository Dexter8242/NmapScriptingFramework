# Nmap Scripting Framework (NSF)
## Introduction
Nmap Scripting Framwork is a simple tool for using nmap, you can search for scripts (including filtering output), run scripts, and scan targets.

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
