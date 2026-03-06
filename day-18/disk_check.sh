#!/bin/bash

set -euo pipefail

check_disk(){
	echo "======Disk Usage(/)======="
	df -h / || return 1
}

check_memory(){
	echo "======Memory Usage======="
	free -h || return 1

}

main(){
	check_disk
	echo
	check_memory
	echo
	echo "All check completed successfully"
}

main
