ask 5 — Make Changes & Build Commit History

You’ll repeat a small cycle:

👉 Edit → Check changes → Stage → Commit → Repeat

✏️ 1. Edit git-commands.md

Open the file and add new commands you learn. For example you can add:

git log --oneline

git add .

git diff

git commit -m

Edit using terminal editor:

nano git-commands.md

Save:

CTRL + O → Enter
CTRL + X
🔎 2. Check What Changed Since Last Commit

Before staging, always inspect changes:

git status

To see exact line changes:

git diff

💡 This shows working directory vs last commit.

📌 3. Stage the Updated File
git add git-commands.md

Check staging area:

git status
💾 4. Commit With a NEW Descriptive Message

Example:

git commit -m "Add viewing commands like git diff and git log oneline"
🔁 5. Repeat This Process 3 Times

Make small edits each time — this builds a clean history.

Example commit ideas:

Add git diff command examples
Update basic workflow section with git add .
Improve formatting and descriptions

👉 DevOps rule: many small commits > one big messy commit

📜 6. View Full History (Compact Format)

After 3+ commits run:

git log --oneline

You should see something like:

a81f3c1 Improve formatting and descriptions
b72aa91 Add git diff examples
c91dd10 Add git commands reference file
🧠 Pro DevOps Tip (Very Useful)

Try this beautiful graph view:

git log --oneline --graph --decorate

| Option       | What it Adds             |
| ------------ | ------------------------ |
| `--oneline`  | Short, clean commit list |
| `--graph`    | Visual tree of commits   |
| `--decorate` | Shows branch/HEAD names  |


This shows commit structure visually — super useful later with branches.
