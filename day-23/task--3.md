Task 3 — Push to GitHub
1️⃣ Create a new empty repo on GitHub

On GitHub:

Click New Repository

Name: devops-git-practice

❗ DO NOT add README, .gitignore, or license

Click Create repository

GitHub will show you a remote URL like:

git@github.com:YOUR-USERNAME/devops-git-practice.git

(or HTTPS version)

2️⃣ Connect your local repo to GitHub (add remote)

Inside your project folder:

git remote add origin git@github.com:YOUR-USERNAME/devops-git-practice.git

Verify:

git remote -v

You should see:

origin  git@github.com:... (fetch)
origin  git@github.com:... (push)
3️⃣ Push your main branch
git push -u origin main

👉 -u sets upstream tracking so future pushes can be just git push.

4️⃣ Push feature-1 branch

First switch if needed:

git switch feature-1

Then push:

git push -u origin feature-1
5️⃣ Verify branches on GitHub

Go to your repository page on GitHub:

Click branch selector dropdown

You should see:

main

feature-1

✅ If both appear — task successful.

📝 Add this answer to your day-23-notes.md
What is the difference between origin and upstream?
🔹 origin

origin is the default name of your remote repository.

It usually points to your own GitHub repo.

Example:

git push origin main

means push to your remote repo.

🔹 upstream

upstream is another remote name (not automatic).

Commonly used when you fork someone else's repo.

upstream points to the original source repository.

| Name     | Meaning                         |
| -------- | ------------------------------- |
| origin   | Your copy of the repo on GitHub |
| upstream | Original repo you forked from   |

