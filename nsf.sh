#!/bin/bash
printHelp() {
	echo "#####################################"
	echo "###    NMAP SCRIPTING FRAMEWORK   ###"
	echo "#####################################"
	echo " USAGE:                              "
	echo " nsf <ACTION> [OPTION]               "
	echo "                                     "
	echo " Actions:                            "
	echo " 	print  - Prints Scripts            "
	echo "	script - Runs scripts              "
	echo "	scan   - Scan a target             "
	echo "			                           "
	echo " Optional options:                   "
	echo " 	Name - For script                  "
	echo " 	Grep filter - For print            "
	echo "	IP - For scan                      "	
	echo "	Flags - For scan                   "
	echo "                                     "
	echo "#####################################"
	echo ""
	echo ""
}

# If arg is help, or no args present, then display help
if [[ $1 == "help" ]] || [[ $# -eq 0 ]]; then
	printHelp
fi

if [[ $1 == "print" ]]; then
	if [ $# -eq 2 ]; then
		RESULT=$(find /usr/share/nmap/scripts -name "*$2*")
		MATCHES=$(echo $RESULT | wc -c)

		if [[ "${MATCHES}" -gt 1 ]]; then
    		echo $RESULT | tr " " "\n"
		else
    		echo "No scripts that are similar to \"$1\""
		fi
	else
		ls /usr/share/nmap/scripts
	fi
fi

if [[ $1 == "script" ]]; then
	if [[ $# -eq 3 ]]; then
		sudo nmap --script=$2 $3
	elif [[ $# -eq 2 ]]; then
		read -p 'IP >>>: ' IP

		if [[ -z "${IP// }" ]]; then
			echo "IP is empty!" >&2
			exit 1
		fi

		sudo nmap --script=$2 $IP
	elif [[ $# -eq 1 ]]; then
		read -p 'Script >>>: ' SCRIPT
		read -p 'IP >>>: ' IP

		if [[ -z "${SCRIPT// }" ]] || [[ -z "${IP// }" ]] ; then
			echo "Script or IP is empty!" >&2
			exit 1
		fi

		sudo nmap --script=$SCRIPT $IP
	else
		echo "Invalid argument length..." >&2
	fi
fi

if [[ $1 == "scan" ]]; then
	if [[ $# -eq 1 ]]; then
		read -p 'Target >>>: ' TARGET

		if [[ -z "${TARGET// }" ]]; then
			echo "Target is empty!" >&2
			exit 1
		fi

		sudo nmap $TARGET -sV --open --top-ports 1024 -oN scan_results.txt
	fi

	if [[ $# -eq 2 ]]; then
		TARGET=$2
		FLAGS=$3
		sudo nmap $TARGET $FLAGS -oN scan_results.txt
	else
		echo "Invalid argument length..." >&2
		echo "Syntax: nsf scan <TARGET> [FLAGS]"
	fi
fi

