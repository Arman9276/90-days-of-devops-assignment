Task 1 — Install and Configure Git
🧩 1. Verify Git is Installed

Open terminal and run:

git --version

👉 If installed, you’ll see something like:

git version 2.xx.x

If you get command not found, install Git:

sudo apt update
sudo apt install git -y
👤 2. Set Your Git Identity (Name & Email)

Git needs your identity for commits.

Run:

git config --global user.name "Your Name"
git config --global user.email "your-email@example.com"

Example (replace with yours):

git config --global user.name "Arman Narsinh"
git config --global user.email "arman9276@gmail.com"

✅ --global means this applies to all projects on your system.

🔎 3. Verify Your Configuration

Check your settings:

git config --list

OR check individually:

git config user.name
git config user.email

You should see your name and email printed.

🧠 Bonus (DevOps Tip — Recommended)

Check where Git stores config:

cat ~/.gitconfig

You will see something like:

[user]
    name = Arman Narsinh
    email = arman9276@gmail.com
