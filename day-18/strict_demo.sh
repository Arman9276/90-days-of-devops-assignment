#!/bin/bash

set -euo pipefail

echo "Testing set -u (Undefined Variables)"
# echo $UNDEFINED_VARIABLE #Error:UNDEFINED_VARIABLE: unbound variable

echo "Testing set -e (Command Failure)"
# ls /nonexistent_folder #Error:No such file or directory

echo "Testing set -o pipefail (Pipe Failure)"
nosuchcommand | echo "i am still running" #error:nosuchcommand: command not found
