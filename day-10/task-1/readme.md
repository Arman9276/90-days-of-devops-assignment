✅ 1️⃣ Create empty file devops.txt
touch devops.txt

This creates a blank file.

✅ 2️⃣ Create notes.txt with content

You can use echo:

echo "This is my DevOps notes file." > notes.txt

OR using cat:

cat > notes.txt
This is my DevOps notes file.
Press Ctrl + D
✅ 3️⃣ Create script.sh using vim

Open vim:

vim script.sh

Press i (insert mode) and add:

echo "Hello DevOps"

Save and exit:

Esc → :wq → Enter
✅ 4️⃣ Verify files and permissions

Run:

ls -l

Example output:

-rw-r--r-- 1 user user   0 Feb 25 09:10 devops.txt
-rw-r--r-- 1 user user  28 Feb 25 09:11 notes.txt
-rw-r--r-- 1 user user  19 Feb 25 09:12 script.sh

--------------------------------------------------------------------------------

✅ Difference between > and >>

*> : Overwrite file

*>> : Append to file (add at end
