Task 4 — Stage and Commit
📌 1. Stage Your File

First make sure you are inside the repo:

cd ~/Documents/devops-git-practice

Stage your file:

git add git-commands.md

👉 This moves the file from Working Directory → Staging Area.

🔎 2. Check What’s Staged
git status

You should see something like:

Changes to be committed:
  new file: git-commands.md

💡 Meaning: Git is ready to include this file in the next commit.

💾 3. Commit with a Meaningful Message
git commit -m "Add git commands reference file with setup and workflow commands"

✅ Good commit messages:

Clear

Short

Describe what changed

📜 4. View Your Commit History

Basic history view:

git log

You’ll see:

commit abc123...
Author: Arman Narsinh
Date: ...

Add git commands reference file with setup and workflow commands

⭐ DevOps Pro Tip (Much Cleaner View)
git log --oneline

Example:

abc123 Add git commands reference file

