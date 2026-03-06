✅ 1️⃣ Make script.sh executable and run it

Add execute permission:

chmod +x script.sh
ls -l script.sh

Expected permissions:

-rwxr-xr-x

Now run it:

./script.sh
✅ 2️⃣ Set devops.txt to read-only (remove write for all)

Remove write permission from owner, group, others:

chmod a-w devops.txt
ls -l devops.txt

Expected:

-r--r--r--

Meaning:

Everyone can read

Nobody can write

✅ 3️⃣ Set notes.txt permission to 640

You learned numbers:

r=4  w=2  x=1
640 → owner=6(rw) group=4(r) others=0(none)

Command:

chmod 640 notes.txt
ls -l notes.txt

Expected:

-rw-r-----
✅ 4️⃣ Create directory project/ with permission 755

Create directory:

mkdir project

Set permission:

chmod 755 project
ls -ld project

Expected:

drwxr-xr-x

Explanation:

Owner → rwx

Group → r-x

Others → r-x
