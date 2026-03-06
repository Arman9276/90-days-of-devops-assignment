*Create tokyo

sudo useradd -m -s /bin/bash tokyo
sudo passwd tokyo

*Create berlin

sudo useradd -m -s /bin/bash berlin
sudo passwd berlin

*Create professor

sudo useradd -m -s /bin/bash professor
sudo passwd professor

*What These Options Mean

-m   → create /home/username directory
-s   → set default shell (bash)

*Verify the Users
Check /etc/passwd

grep -E "tokyo|berlin|professor" /etc/passwd

*Check Home Directories

ls -l /home/


----------------------------------------------------------------------------------------------------------------------------------------------

✅ Step 1 — Create the Users

Use useradd or the easier admin command adduser.

👉 Recommended (interactive + safer):

sudo adduser tokyo
sudo adduser berlin
sudo adduser professor

What happens:

Home directory created automatically (/home/username)

Password prompt appears

User info questions (you can press ENTER to skip)

🔐 Step 2 — Set or Change Passwords (if needed)

If you skipped password during creation:

sudo passwd tokyo
sudo passwd berlin
sudo passwd professor
🔎 Step 3 — Verify Users Exist
Check /etc/passwd

This file stores all system users.

grep -E "tokyo|berlin|professor" /etc/passwd

----------------------------------------------------------------------------------------------------------------------------------------------

🧑‍💻 adduser vs useradd (Simple Explanation)
✅ adduser — High-level, friendly command

👉 This is a script built on top of useradd.

What it does automatically:

Creates home directory

Asks for password interactively

Creates default settings

Copies files from /etc/skel

Easier for humans

Example:

sudo adduser tokyo

You’ll see prompts like:

Enter new UNIX password:
Full Name:
Room Number:

✔ Best for daily admin work.

⚙️ useradd — Low-level system command

👉 This is the real backend binary.

What it does:

Creates user ONLY

No password prompt

Minimal setup

Requires flags for everything

Example:

sudo useradd tokyo

Problems if you forget options:

❌ No home directory

❌ No password

❌ Not fully usable yet

Correct usage usually looks like:

sudo useradd -m -s /bin/bash tokyo
sudo passwd tokyo
