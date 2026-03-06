#!/bin/bash

set -euo pipefail

greet() {
	local name="$1"
	echo "Hello, $name !"
}

add(){
	local num1="$1"
	local num2="$2"
	local sum=$((num1+num2))
	echo "SUM:$sum"
}
#call functions
greet "Arman"
add 5 8
