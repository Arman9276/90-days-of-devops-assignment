1. Trigger

Definition:
A Trigger is the event that starts the CI/CD pipeline.

Examples of triggers:

Pushing code to a Git repository

Creating a pull request

A scheduled time (cron job)

Manual start

Example:
A developer pushes code to GitHub, which automatically starts the pipeline.

2. Stage

Definition:
A Stage is a logical phase in the pipeline that groups related jobs together.

Common stages:

Build

Test

Deploy

Each stage runs in order, and the next stage runs only if the previous one succeeds.

Example:
Build → Test → Deploy

.
