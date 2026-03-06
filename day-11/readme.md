ls -l

----------------------------------------------------------------

What’s the difference between owner and group?

Owner:

The owner is the specific user who owns the file.

Usually the person who created the file.

The owner has their own set of permissions (read, write, execute).

Group:

The group is a collection of users.

Any user who belongs to that group gets the group-level permissions.

Useful for teamwork (like devops or project-team).

--------------------------------------------------------------------------------------------------------------
Task 2 — Basic chown Operations
1️⃣ Create the file
touch devops-file.txt
2️⃣ Check current owner
ls -l devops-file.txt

Example output:

-rw-r--r-- 1 arman arman 0 Feb 25 devops-file.txt

👉 First arman = owner
👉 Second arman = group

3️⃣ Create users (if they don’t exist)

Check:

id tokyo
id berlin

If not found, create them:

sudo useradd tokyo
sudo useradd berlin
4️⃣ Change owner to tokyo
sudo chown tokyo devops-file.txt

Verify:

ls -l devops-file.txt

Expected:

-rw-r--r-- 1 tokyo arman 0 Feb 25 devops-file.txt
5️⃣ Change owner to berlin
sudo chown berlin devops-file.txt

Verify again:

ls -l devops-file.txt

Expected:

-rw-r--r-- 1 berlin arman 0 Feb 25 devops-file.txt
🧠 What you learned?

✅ chown changes file ownership
✅ Needs sudo because only root can change owners
✅ Always verify using ls -l

-------------------------------------------------------------------------------------------------------------

Task 3: Basic chgrp Operations

1️⃣ Create the file
touch team-notes.txt
2️⃣ Check current group
ls -l team-notes.txt

Example:

-rw-r--r-- 1 arman arman 0 Feb 25 team-notes.txt

👉 Second arman = current group

3️⃣ Create the new group
sudo groupadd heist-team

Verify group exists:

cat /etc/group | grep heist-team
4️⃣ Change file group to heist-team

Use chgrp:

sudo chgrp heist-team team-notes.txt
5️⃣ Verify the change
ls -l team-notes.txt

Expected output:

-rw-r--r-- 1 arman heist-team 0 Feb 25 team-notes.txt
🧠 What learned?

✅ chgrp changes the group ownership of a file
✅ Requires sudo if you’re not allowed to change groups
✅ Always confirm using ls -l

----------------------------------------------------------------------------------------------------------------

Task 4: Combined Owner & Group Change

1️⃣ Create file project-config.yaml
touch project-config.yaml
2️⃣ Change owner ➜ professor and group ➜ heist-team

(One command using owner:group syntax)

sudo chown professor:heist-team project-config.yaml

Verify:

ls -l project-config.yaml

Expected format:

-rw-r--r-- 1 professor heist-team ...
3️⃣ Create directory app-logs/
mkdir app-logs
4️⃣ Change owner ➜ berlin and group ➜ heist-team
sudo chown berlin:heist-team app-logs

Verify:

ls -ld app-logs

👉 Use -d so you see directory ownership instead of its contents.

🧠 Documentation

✅ sudo chown owner:group file changes both owner and group at once
✅ Works for files and directories
✅ Saves time compared to running chown + chgrp separately

---------------------------------------------------------------------------------------------------------------

Task 5: Recursive Ownership

1️⃣ Create directory structure
mkdir -p heist-project/vault
mkdir -p heist-project/plans

touch heist-project/vault/gold.txt
touch heist-project/plans/strategy.conf
2️⃣ Create group planners
sudo groupadd planners

Verify:

cat /etc/group | grep planners
3️⃣ Change ownership recursively

👉 Use -R so the change applies to:

main directory

all subdirectories

all files inside

sudo chown -R professor:planners heist-project/

What this does:

Owner → professor

Group → planners

Applies to everything inside heist-project

4️⃣ Verify all changes
ls -lR heist-project/

Example expected output:

heist-project/:
drwxr-xr-x 2 professor planners vault
drwxr-xr-x 2 professor planners plans

heist-project/vault:
-rw-r--r-- 1 professor planners gold.txt

heist-project/plans:
-rw-r--r-- 1 professor planners strategy.conf


Documentation Notes

✅ -R = recursive ownership change
✅ Applies to directories + subdirectories + files
✅ Common DevOps use: fixing permissions for full project folders

--------------------------------------------------------------------------------------------------------------

Task 5: Recursive Ownership

1️⃣ Create directory structure
mkdir -p heist-project/vault
mkdir -p heist-project/plans

touch heist-project/vault/gold.txt
touch heist-project/plans/strategy.conf
2️⃣ Create group planners
sudo groupadd planners

Verify:

cat /etc/group | grep planners
3️⃣ Change ownership recursively

👉 Use -R so the change applies to:

main directory

all subdirectories

all files inside

sudo chown -R professor:planners heist-project/

What this does:

Owner → professor

Group → planners

Applies to everything inside heist-project

4️⃣ Verify all changes
ls -lR heist-project/

Example expected output:

heist-project/:
drwxr-xr-x 2 professor planners vault
drwxr-xr-x 2 professor planners plans

heist-project/vault:
-rw-r--r-- 1 professor planners gold.txt

heist-project/plans:
-rw-r--r-- 1 professor planners strategy.conf
Documentation Notes

✅ -R = recursive ownership change
✅ Applies to directories + subdirectories + files
✅ Common DevOps use: fixing permissions for full project folders
