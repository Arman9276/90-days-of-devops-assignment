#!/bin/bash
echo "Hello,DevOps"


<<note
Document: What happens if you remove the shebang line?

If you remove the shebang line, the script may run using the system’s default shell instead of Bash.
When you run ./script.sh, it might fail if the script contains Bash-specific syntax.
If you run bash script.sh, it will still work because you manually specify Bash.
That’s why adding a shebang ensures consistent and reliable execution.
note
