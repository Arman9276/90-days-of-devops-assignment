# Day 22 — Git Workflow Notes

## 1️⃣ What is the difference between `git add` and `git commit`?

`git add` prepares changes by moving them into the staging area. It tells Git *which* changes you want to include next.
`git commit` actually saves those staged changes into the repository history as a new snapshot with a message.

👉 Simple idea:

* **git add = select changes**
* **git commit = save changes permanently**

---

## 2️⃣ What does the staging area do? Why doesn't Git just commit directly?

The staging area acts like a preparation zone where you review and control exactly what goes into a commit.
Git doesn’t commit directly because developers often change many files but only want to commit specific parts. The staging area allows clean, organized commits instead of messy ones.

---

## 3️⃣ What information does `git log` show you?

`git log` displays the commit history, including:

* Commit ID (hash)
* Author name and email
* Date and time of commit
* Commit message

It helps track what changes happened over time and who made them.

---

## 4️⃣ What is the `.git/` folder and what happens if you delete it?

The `.git/` folder is the internal database of the repository. It stores:

* All commits
* Branch information
* Configuration
* History and objects

If you delete `.git/`, the project stops being a Git repository. All history and tracking information are lost, and Git commands will no longer work.

---

## 5️⃣ What is the difference between a working directory, staging area, and repository?

* **Working Directory:** Your actual project files where you edit code.
* **Staging Area:** A temporary space where selected changes are prepared for a commit.
* **Repository:** The saved history of commits stored inside `.git/`.

👉 Workflow flow:
Working Directory → Staging Area → Repository

