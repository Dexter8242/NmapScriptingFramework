#!/bin/bash
printHelp() {
	echo "#####################################"
	echo "###    NMAP SCRIPTING FRAMEWORK   ###"
	echo "#####################################"
	echo " USAGE:                        "
	echo " nsf <ACTION> [OPTION]         "
	echo "                               "
	echo " Actions:                      "
	echo " 	print  - Prints Scripts  "
	echo "	script - Runs scripts   "
	echo "	scan   - Scan a target"
	echo "			        "
	echo " Optional options:"
	echo " 	Name - For script"
	echo " 	Grep filter - For print"
	echo "	IP - For scan"
	echo "	Flags - For scan"
	echo "                              "
	echo "#####################################"
	echo ""
	echo ""
}
if [[ $1 == "print" ]]; then
	if [ $# -eq 2 ]; then
		ls /usr/share/nmap/scripts | grep $2
	else
		ls /usr/share/nmap/scripts
	fi
fi
if [[ $1 == "script" ]]; then
	if [[ $# -eq 3 ]]; then
		sudo nmap --script=$2 $3
	fi
	if [[ $# -eq 2 ]]; then
		read -p 'IP >>>: ' IP
		sudo nmap --script=$2 $IP
	fi
	if [[ $# -eq 1 ]]; then
		read -p 'Script >>>: ' SCRIPT
		read -p 'IP >>>: ' IP
		sudo nmap --script=$SCRIPT $IP
	fi
fi
if [[ $1 == "scan" ]]; then
	if [[ $# -eq 1 ]]; then
		read -p 'Target >>>: ' TARGET
		sudo nmap $TARGET -sV --open --top-ports 1024 -oN scan_results.txt
	fi
	if [[ $# -eq 2 ]]; then
		TARGET=$2
		FLAGS=$3
		sudo nmap $TARGET $FLAGS -oN scan_results.txt
	else
		echo "Invalid argument length..."
		echo "Syntax: nsf scan <TARGET> [FLAGS]"
	fi
fi
if [[ $1 == "help" ]]; then
	printHelp
fi
