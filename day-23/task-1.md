What is a branch in Git?

A branch in Git is a separate line of development. It lets you work on new features, fixes, or experiments without affecting the main codebase. Each branch points to a different sequence of commits, but they all share the same project history.

👉 Think of a branch like a parallel workspace inside the same repository.

Why do we use branches instead of committing everything to main?

We use branches because they keep work safe and organized:

Prevents breaking the stable main branch

Allows multiple developers to work independently

Makes testing features before merging easier

Helps manage bug fixes and new features separately

If everyone committed directly to main, the project could become unstable very quickly.

What is HEAD in Git?

HEAD is a special pointer that tells Git where you currently are.

It usually points to the latest commit of the current branch.

When you switch branches, HEAD moves to that branch.

New commits are added where HEAD is pointing.

👉 Simple idea: HEAD = your current position in the repository.

What happens to your files when you switch branches?

When you run git checkout <branch> (or git switch <branch>):

Git updates your working directory to match that branch’s latest commit.

Files may change, appear, or disappear depending on differences between branches.

Uncommitted changes can cause conflicts or prevent switching.

Example:

main branch has app.js

feature branch has app.js + test.js

Switching to feature will make test.js appear in your folder.
