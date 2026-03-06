✅ 1️⃣ Read notes.txt using cat
cat notes.txt

👉 Shows full file content in terminal.

✅ 2️⃣ View script.sh in vim (read-only mode)
vim -R script.sh

OR

view script.sh

👉 Opens file without allowing changes (safe viewing mode).

✅ 3️⃣ Display first 5 lines of /etc/passwd
head -n 5 /etc/passwd

Explanation:

head = shows beginning of file

-n 5 = number of lines

✅ 4️⃣ Display last 5 lines of /etc/passwd
tail -n 5 /etc/passwd

Explanation:

tail = shows end of file

-n 5 = last 5 lines

🧠 Quick DevOps Tip

These commands are used daily for log inspection:

tail -f /var/log/syslog

👉 Live monitoring of logs (very important for troubleshooting).
