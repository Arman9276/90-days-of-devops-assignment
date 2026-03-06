✅ Step 1 — Create the Directory
sudo mkdir -p /opt/dev-project

Verify:

ls -ld /opt/dev-project
✅ Step 2 — Set Group Owner to developers
sudo chown :developers /opt/dev-project

👉 : before group name means change only group ownership.

Check:

ls -ld /opt/dev-project

Example:

drwxr-xr-x root developers /opt/dev-project
✅ Step 3 — Set Permissions to 775
sudo chmod 775 /opt/dev-project

Meaning:

7 → owner = rwx
7 → group = rwx
5 → others = r-x

Verify again:

ls -ld /opt/dev-project

Expected:

drwxrwxr-x root developers /opt/dev-project
🧠 (Recommended Admin Practice — Very Important)

To make new files automatically inherit the developers group, set SGID bit:

sudo chmod g+s /opt/dev-project

Now you should see:

drwxrwsr-x

This is how real shared project folders are configured.

✅ Step 4 — Test File Creation
👉 Switch to user tokyo
su - tokyo
touch /opt/dev-project/tokyo-file.txt
exit
👉 Switch to user berlin
su - berlin
touch /opt/dev-project/berlin-file.txt
exit
🔎 Step 5 — Verify Everything
Check permissions + ownership
ls -l /opt/dev-project

You should see something like:

-rw-r--r-- 1 tokyo  developers 0 tokyo-file.txt
-rw-r--r-- 1 berlin developers 0 berlin-file.txt

Notice:

✔ Same group (developers)
✔ Both users could create files

Check directory permissions
ls -ld /opt/dev-project

Expected:

drwxrwsr-x root developers /opt/dev-project
🧪 Quick Verification Checklist

Run these:

stat /opt/dev-project
groups tokyo
groups berlin

If both users can create files → ✅ Task completed.
