*Step 1 — Create the Groups

Use the groupadd command.

sudo groupadd developers
sudo groupadd admins

What this does:

Creates new group entries

Assigns unique GID (Group ID)

Updates /etc/group

* Step 2 — Verify Groups Exist

Check /etc/group
grep -E "developers|admins" /etc/group

Example output:

developers:x:1005:
admins:x:1006:

Meaning:

groupname : password-placeholder : GID : members

*Alternative Verification (Useful Admin Command)
getent group developers
getent group admins

*getent is better because it checks system databases (local + LDAP if present).

*Quick Sysadmin Tip

If you try to create a group that already exists:

groupadd: group 'developers' already exists

You can check first:

getent group developers || sudo groupadd developers
