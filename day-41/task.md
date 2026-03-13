ask 1: Trigger on Pull Request

    Create .github/workflows/pr-check.yml
    Trigger it only when a pull request is opened or updated against main
    Add a step that prints: PR check running for branch: <branch name>
    Create a new branch, push a commit, and open a PR
    Watch the workflow run automatically

Verify: Does it show up on the PR page?

Here is the complete step-by-step solution for Task: Trigger on Pull Request (GitHub Actions).

1️⃣ Create Workflow File

Inside your repository create the folder structure:

.github/workflows/

Then create the file:

.github/workflows/pr-check.yml

You can create it from terminal in Ubuntu:

mkdir -p .github/workflows
touch .github/workflows/pr-check.yml
2️⃣ Add Workflow Code

Open the file:

nano .github/workflows/pr-check.yml

Paste this:

name: PR Check

on:
  pull_request:
    branches:
      - main
    types: [opened, synchronize]

jobs:
  pr-check:
    runs-on: ubuntu-latest

    steps:
      - name: Print PR branch
        run: echo "PR check running for branch: ${{ github.head_ref }}"

Save:

CTRL + O
ENTER
CTRL + X
3️⃣ Commit and Push

Add the workflow to git.

git add .github/workflows/pr-check.yml
git commit -m "Add PR check workflow"
git push origin main
4️⃣ Create a New Branch

Now create a branch to trigger the PR.

git checkout -b test-pr

Make a small change:

echo "testing PR workflow" >> test.txt

Commit and push:

git add .
git commit -m "Test PR workflow"
git push origin test-pr
5️⃣ Open Pull Request

Go to GitHub repository page

You will see a button:

Compare & pull request

Click it.

Create PR:

base: main
compare: test-pr

Click Create Pull Request

6️⃣ Workflow Automatically Runs

When PR is created:

GitHub automatically triggers the workflow because:

on: pull_request
branches: main
types: [opened, synchronize]
7️⃣ Verify It Runs

Open the Pull Request page.

You should see a section like:

Checks
✔ PR Check / pr-check (in progress or completed)

Click Details.

You will see output like:

PR check running for branch: test-pr
✔ Expected Verification Answer

For your notes / assignment:

Does it show up on the PR page?

✅ Yes.
When the pull request is opened or updated, the workflow automatically runs and appears under the Checks section of the PR page, showing the status of the GitHub Action.

✅ If you want, I can also show you:

Common mistakes students make in this task

Why ${{ github.head_ref }} is used

How to debug PR workflows (very important in DevOps interviews).

Task 2: Scheduled Trigger

    Add a schedule: trigger to any workflow using cron syntax
    Set it to run every day at midnight UTC
    Write in your notes: What is the cron expression for every Monday at 9 AM?
1️⃣ Add a Scheduled Trigger in GitHub Actions

You can add a cron schedule inside your workflow file.

Example: .github/workflows/pr-check.yml

name: PR Check

on:
  pull_request:
    branches: [main]
    types: [opened, synchronize]

  schedule:
    - cron: '0 0 * * *'   # Runs every day at midnight UTC

jobs:
  pr-check:
    runs-on: ubuntu-latest

    steps:
      - name: Print message
        run: echo "Scheduled workflow running"
Explanation of the cron expression
┌──────── minute (0–59)
│ ┌────── hour (0–23)
│ │ ┌──── day of month (1–31)
│ │ │ ┌── month (1–12)
│ │ │ │ ┌ day of week (0–7) (0 or 7 = Sunday)
│ │ │ │ │
0 0 * * *

0 0 * * *

Meaning:

Minute → 0

Hour → 0

Day → every day

Month → every month

Weekday → every weekday

So it runs every day at 00:00 (midnight) UTC.

2️⃣ Answer for Your Notes

Cron expression for every Monday at 9 AM

0 9 * * 1

Explanation:

0 → minute

9 → hour (9 AM)

* → every day of month

* → every month

1 → Monday

So it runs every Monday at 09:00 UTC.

✅ Summary for your assignment notes

Daily at midnight → 0 0 * * *

Every Monday at 9 AM → 0 9 * * 1

If you want, I can also show 5 common cron schedules used in CI/CD pipelines (very useful for DevOps tasks).

ask 3: Manual Trigger

    Create .github/workflows/manual.yml with a workflow_dispatch: trigger
    Add an input that asks for an environment name (staging/production)
    Print the input value in a step
    Go to the Actions tab → find the workflow → click Run workflow

Verify: Can you trigger it manually and see your input printed?

Here is the step-by-step solution for Task 3: Manual Trigger (GitHub Actions).

1️⃣ Create Workflow File

Create the workflow file:

.github/workflows/manual.yml

From terminal (Ubuntu):

mkdir -p .github/workflows
touch .github/workflows/manual.yml
2️⃣ Add Workflow Code

Open the file:

nano .github/workflows/manual.yml

Paste this workflow:

name: Manual Deployment

on:
  workflow_dispatch:
    inputs:
      environment:
        description: "Choose environment"
        required: true
        default: "staging"

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Print selected environment
        run: echo "Deployment environment is ${{ github.event.inputs.environment }}"

Save and exit:

CTRL + O
ENTER
CTRL + X
3️⃣ Commit and Push

Add the workflow to your repository.

git add .github/workflows/manual.yml
git commit -m "Add manual workflow trigger"
git push origin main
4️⃣ Run the Workflow Manually

Go to your GitHub repository

Click Actions

Select Manual Deployment workflow

Click Run workflow

Enter environment value

Example:

staging

or

production

Then click Run workflow.

5️⃣ Check the Output

Open the workflow run.

Inside the step logs you should see something like:

Deployment environment is staging

or

Deployment environment is production
✅ Verification Answer (for your notes)

Can you trigger it manually and see your input printed?

✅ Yes.
The workflow appears in the Actions tab, and using Run workflow allows manually triggering it.
The entered input value (environment name) is printed in the workflow logs.

✅ If you want, I can also show you a professional DevOps version of this workflow where:

environment is dropdown (staging / production)

it prevents accidental production deployment

it looks like real industry pipelines.

Task 4: Matrix Builds

Create .github/workflows/matrix.yml that:

    Uses a matrix strategy to run the same job across:
        Python versions: 3.10, 3.11, 3.12
    Each job installs Python and prints the version
    Watch all 3 run in parallel

Then extend the matrix to also include 2 operating systems — how many total jobs run now?
1️⃣ Create the Workflow File

Create the file:

.github/workflows/matrix.yml

From terminal:

mkdir -p .github/workflows
touch .github/workflows/matrix.yml
2️⃣ Matrix Build for Python Versions

Open the file:

nano .github/workflows/matrix.yml

Add this workflow:

name: Matrix Build

on:
  push:
    branches: [main]

jobs:
  build:
    runs-on: ubuntu-latest

    strategy:
      matrix:
        python-version: [3.10, 3.11, 3.12]

    steps:
      - name: Checkout repo
        uses: actions/checkout@v4

      - name: Setup Python
        uses: actions/setup-python@v5
        with:
          python-version: ${{ matrix.python-version }}

      - name: Print Python version
        run: python --version

Commit and push:

git add .github/workflows/matrix.yml
git commit -m "Add matrix build workflow"
git push origin main
3️⃣ What Happens Now

GitHub Actions creates 3 parallel jobs:

Job	Python Version
Job 1	Python 3.10
Job 2	Python 3.11
Job 3	Python 3.12

All run at the same time.

You will see them in the Actions tab running in parallel.

4️⃣ Extend Matrix with Operating Systems

Now update the matrix:

name: Matrix Build

on:
  push:
    branches: [main]

jobs:
  build:
    runs-on: ${{ matrix.os }}

    strategy:
      matrix:
        os: [ubuntu-latest, windows-latest]
        python-version: [3.10, 3.11, 3.12]

    steps:
      - name: Checkout repo
        uses: actions/checkout@v4

      - name: Setup Python
        uses: actions/setup-python@v5
        with:
          python-version: ${{ matrix.python-version }}

      - name: Print Python version
        run: python --version
5️⃣ How Many Jobs Run Now?

Matrix combinations:

OS	Python
Ubuntu	3.10
Ubuntu	3.11
Ubuntu	3.12
Windows	3.10
Windows	3.11
Windows	3.12

Total jobs:

3 Python versions × 2 OS = 6 jobs

✅ Answer for your notes

Total jobs running: 6

✅ Summary

Matrix	Jobs
Python only	3
Python + OS	6

If you want, I can also show you how big companies use matrix builds for 20+ environments (Linux + Mac + Windows + multiple Python + Node versions). This is a very common DevOps interview question.

Task 5: Exclude & Fail-Fast

    In your matrix, exclude one specific combination (e.g., Python 3.10 on Windows)
    Set fail-fast: false — trigger a failure in one job and observe what happens to the rest
    Write in your notes: What does fail-fast: true (the default) do vs false?
1️⃣ Update Your Matrix Workflow

Edit your workflow file:

.github/workflows/matrix.yml

Add exclude and fail-fast.

name: Matrix Build

on:
  push:
    branches: [main]

jobs:
  build:
    runs-on: ${{ matrix.os }}

    strategy:
      fail-fast: false
      matrix:
        os: [ubuntu-latest, windows-latest]
        python-version: [3.10, 3.11, 3.12]

        exclude:
          - os: windows-latest
            python-version: 3.10

    steps:
      - name: Checkout repo
        uses: actions/checkout@v4

      - name: Setup Python
        uses: actions/setup-python@v5
        with:
          python-version: ${{ matrix.python-version }}

      - name: Print Python version
        run: python --version

      - name: Force a failure (test step)
        run: exit 1
2️⃣ What the exclude Does

This removes one combination from the matrix.

Excluded:

Windows + Python 3.10

Remaining jobs:

OS	Python
Ubuntu	3.10
Ubuntu	3.11
Ubuntu	3.12
Windows	3.11
Windows	3.12

Total jobs now:

5 jobs
3️⃣ What fail-fast: false Does

When you push the workflow:

One job will fail because of exit 1

The other matrix jobs will continue running

You will see:

❌ some jobs failed
✅ some jobs succeeded

All jobs complete even if one fails.

4️⃣ Answer for Your Notes
What does fail-fast: true (default) do?

If any job in the matrix fails,

All remaining running jobs are cancelled immediately

Purpose: save CI time and resources

What does fail-fast: false do?

If one job fails,

Other jobs continue running until they finish

Purpose: see results for all environments

✅ Short answer for assignment

Setting	Behavior
fail-fast: true	Stops all remaining jobs when one job fails
fail-fast: false	Allows all jobs to continue even if one fails

💡 Real DevOps Tip

Most companies use:

fail-fast: false

when testing multiple environments, because they want to see which environments failed, not just the first one.
