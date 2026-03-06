✅ 1️⃣ Try writing to a read-only file

Your devops.txt was set to read-only (-r--r--r--).

Test:

echo "New line" >> devops.txt
💥 What happens?

You should see an error like:

bash: devops.txt: Permission denied
📄 Why?

No one has write (w) permission.

Even the owner cannot modify the file.

✅ 2️⃣ Try executing a file without execute permission

First remove execute permission from script.sh:

chmod -x script.sh
ls -l script.sh

Now try running:

./script.sh
💥 Error message:
bash: ./script.sh: Permission denied
📄 Why?

Linux needs x permission to run a file as a program/script.

Without execute bit, shell blocks execution.

🧾 3️⃣ Documented Errors (Your Answer Section)

You can write something like this in your notes:

✅ Writing to read-only file

Error: Permission denied
Reason: No write permission on file.

✅ Executing without execute permission

Error: Permission denied
Reason: Execute (x) bit not set.
