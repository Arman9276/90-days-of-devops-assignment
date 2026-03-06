Step 1 — Add Users to Groups

We use:

usermod -aG <group> <user>

👉 -aG is important:

-G = add to group list

-a = append (prevents removing existing groups)

👨‍💻 tokyo → developers
sudo usermod -aG developers tokyo
👨‍💻 berlin → developers + admins
sudo usermod -aG developers berlin
sudo usermod -aG admins berlin
👨‍💻 professor → admins
sudo usermod -aG admins professor
🔎 Step 2 — Verify Group Membership
✅ Best Command (Real Sysadmin Choice)
id tokyo
id berlin
id professor

Example output:

uid=1002(tokyo) gid=1002(tokyo) groups=1002(tokyo),developers
✅ Alternative Command
groups tokyo
groups berlin
groups professor

Example:

berlin : berlin developers admins
✅ Check from /etc/group directly
grep -E "developers|admins" /etc/group

You should see usernames added at the end.

🧠 Important DevOps Tip

If you forget -a:

sudo usermod -G admins berlin

⚠️ This removes berlin from all other groups — very common beginner mistake.

Always use:

usermod -aG

