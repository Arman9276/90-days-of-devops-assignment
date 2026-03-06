✅ 1️⃣ Create User nairobi (with home directory)
sudo useradd -m -s /bin/bash nairobi
sudo passwd nairobi

Verify:

ls /home/

You should see nairobi/.

✅ 2️⃣ Create Group project-team
sudo groupadd project-team

Verify:

grep project-team /etc/group
✅ 3️⃣ Add Users to project-team

Add nairobi and tokyo:

sudo usermod -aG project-team nairobi
sudo usermod -aG project-team tokyo

Verify membership:

groups nairobi
groups tokyo

Expected output includes project-team.

✅ 4️⃣ Create /opt/team-workspace Directory
sudo mkdir -p /opt/team-workspace
✅ 5️⃣ Set Group Owner + Permissions (775)
Change group owner:
sudo chown :project-team /opt/team-workspace
Set permissions:
sudo chmod 775 /opt/team-workspace

💡 Recommended (real team setup — keeps group ownership on new files):

sudo chmod g+s /opt/team-workspace
🔎 6️⃣ Verify Directory Settings
ls -ld /opt/team-workspace

Expected:

drwxrwsr-x root project-team /opt/team-workspace
🧪 7️⃣ Test — Create File as nairobi

Switch user:

su - nairobi
touch /opt/team-workspace/test-file.txt
exit
🔎 8️⃣ Final Verification
ls -l /opt/team-workspace

You should see something like:

-rw-r--r-- 1 nairobi project-team test-file.txt
