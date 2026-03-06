Task 2 — Branching Commands

1️⃣ List all branches
git branch

👉 Shows local branches.
Current branch has * symbol.

2️⃣ Create a new branch called feature-1
git branch feature-1
3️⃣ Switch to feature-1
git switch feature-1

(Old way:)

git checkout feature-1
4️⃣ Create AND switch in one command (feature-2)
git switch -c feature-2

Old syntax:

git checkout -b feature-2
5️⃣ Move between branches using git switch
git switch main
git switch feature-1
🔎 Difference: git switch vs git checkout

git switch → used only for branches (safer & clearer)

git checkout → older command, used for branches and files

Modern Git recommends git switch for branch movement.

6️⃣ Make a commit on feature-1 only

First ensure you are on feature-1:

git switch feature-1

Create or edit a file:

echo "Feature 1 work" >> feature1.txt
git add feature1.txt
git commit -m "Added feature-1 work"
7️⃣ Switch back to main and verify
git switch main
ls
git log --oneline

✅ You should NOT see feature1.txt or that commit on main.
This proves branches are isolated.

8️⃣ Delete a branch you don’t need

Example: delete feature-2

git branch -d feature-2

Force delete (if not merged):

git branch -D feature-2


*git-commands.md

## Branching Commands

git branch                 # list branches
git branch feature-1       # create branch
git switch feature-1       # switch branch
git switch -c feature-2    # create + switch
git switch main            # move back to main
git branch -d feature-2    # delete branch
