name: Matrix Build

Check failure on line 1 in .github/workflows/matrix.yml
GitHub Actions / .github/workflows/matrix.yml

Invalid workflow file

(Line: 2, Col: 4): Unexpected value '', (Line: 3, Col: 1): Unexpected value 'push', (Line: 8, Col: 5): Unexpected value 'run-on', (Line: 8, Col: 5): There's not enough info to determine what you meant. Add one of these properties: cancel-timeout-minutes, container, continue-on-error, defaults, env, environment, outputs, runs-on, secrets, services, snapshot, steps, timeout-minutes, uses, with, (Line: 11, Col: 5): Unexpected value 'matrix', (Line: 11, Col: 5): There's not enough info to determine what you meant. Add one of these properties: cancel-timeout-minutes, container, continue-on-error, defaults, env, environment, outputs, runs-on, secrets, services, snapshot, steps, timeout-minutes, uses, with, (Line: 15, Col: 5): A sequence was not expected

on: 
push:
  branches: [feature]

jobs:
  build:
    run-on: ubuntu-latest

  strategy:
    matrix:
      python-version: [3.10,3.11,3.12,3.13,3.14]

  steps:
    - name: Checkout repo
      uses: actions/checkout@v5

    - name: Setup Python
      uses: actions/setup-python@v5
      with:
        python-version: ${{ matrix.python-version }}
    - name: Print Python Version
      run: python --version

Your workflow has YAML structure mistakes and GitHub Actions keyword typos. GitHub Actions is very strict about indentation and property names.

Let’s go through the problems.

❌ Problems in Your File
1️⃣ Wrong keyword

You wrote:

run-on: ubuntu-latest

Correct keyword is:

runs-on: ubuntu-latest
2️⃣ strategy is in the wrong place

You placed strategy outside the job, but it must be inside the job (build).

Wrong:

jobs:
  build:
    run-on: ubuntu-latest

  strategy:

Correct structure:

jobs:
  build:
    runs-on: ubuntu-latest
    strategy:
3️⃣ steps indentation is wrong

steps must also be inside the job.

✅ Correct Working File
name: Matrix Build

on:
  push:
    branches: [feature]

jobs:
  build:
    runs-on: ubuntu-latest

    strategy:
      matrix:
        python-version: [3.10, 3.11, 3.12, 3.13, 3.14]

    steps:
      - name: Checkout repo
        uses: actions/checkout@v5

      - name: Setup Python
        uses: actions/setup-python@v5
        with:
          python-version: ${{ matrix.python-version }}

      - name: Print Python Version
        run: python --version
📊 What This Workflow Does

When you push to feature branch, GitHub will run 5 jobs in parallel:

Job	Python Version
Job 1	Python 3.10
Job 2	Python 3.11
Job 3	Python 3.12
Job 4	Python 3.13
Job 5	Python 3.14

Each job will:

Checkout repo

Install Python version

Print Python version

🔎 Quick YAML Structure (Important)

Always remember this hierarchy:

name
on
jobs
  job-name
    runs-on
    strategy
    steps
🚀 Bonus (Better Matrix Task)

If you extend it with 2 operating systems:

strategy:
  matrix:
    os: [ubuntu-latest, windows-latest]
    python-version: [3.10, 3.11, 3.12]

Total jobs = 2 × 3 = 6 jobs

✅ If you want, I can also show you how to debug GitHub Actions YAML errors in 10 seconds (very useful trick developers use).

Run actions/setup-python@v5
Installed versions
  Version 3.1 was not found in the local cache
  Error: The version '3.1' with architecture 'x64' was not found for Ubuntu 24.04.
  The list of all available versions can be found here: https://raw.githubusercontent.com/actions/python-versions/main/versions-manifest.json

The error happens because GitHub Actions is trying to install Python 3.1 instead of 3.10.

This usually happens when the matrix value is written incorrectly or parsed incorrectly.

Your error:

Version 3.1 was not found in the local cache
Error: The version '3.1' with architecture 'x64' was not found

Python 3.1 is very old and not supported, so the action fails.

✅ Fix

Wrap the Python versions in quotes so YAML treats them as strings.

Correct matrix
strategy:
  matrix:
    python-version: ["3.10", "3.11", "3.12"]
✅ Full Working Workflow
name: Matrix Build

on:
  push:
    branches: [feature]

jobs:
  build:
    runs-on: ubuntu-latest

    strategy:
      matrix:
        python-version: ["3.10", "3.11", "3.12"]

    steps:
      - name: Checkout repo
        uses: actions/checkout@v5

      - name: Setup Python
        uses: actions/setup-python@v5
        with:
          python-version: ${{ matrix.python-version }}

      - name: Print Python Version
        run: python --version
📌 Why Quotes Are Important

Without quotes:

python-version: [3.10]

YAML may interpret it as a number, which sometimes becomes 3.1 internally.

With quotes:

python-version: ["3.10"]

It is treated as a string, which GitHub Actions expects.

📊 Expected Result in Actions Tab

You will see 3 parallel jobs:

build (3.10)
build (3.11)
build (3.12)

Each prints something like:

Python 3.10.x
Python 3.11.x
Python 3.12.x

✅ If you want, I can also show you how to extend this matrix to run on Windows + Ubuntu (real DevOps practice).

fail-fast which come under matrix stratgey and you don't tell please tell this important things otherwise i wll not get the jobs

Good question 👍 — fail-fast is an important option in matrix strategy, but it is not required to run jobs. Your jobs will run even without it. However, understanding it is important for CI/CD pipelines.

What is fail-fast in Matrix Strategy?

fail-fast controls what happens when one matrix job fails.

Default Behavior

By default:

fail-fast: true

If one job fails, GitHub cancels all other running matrix jobs.

Example matrix:

Python 3.10

Python 3.11

Python 3.12

If 3.10 fails, then 3.11 and 3.12 will stop immediately.

When to Use fail-fast: false

Sometimes you want all jobs to run even if one fails.

Example reasons:

Testing multiple Python versions

You want to see which versions fail

Debugging compatibility

Then use:

fail-fast: false

Now even if one job fails, other jobs continue running.

Example with fail-fast
name: Matrix Build

on:
  push:
    branches: [feature]

jobs:
  build:
    runs-on: ubuntu-latest

    strategy:
      fail-fast: false
      matrix:
        python-version: ["3.10", "3.11", "3.12"]

    steps:
      - name: Checkout repo
        uses: actions/checkout@v5

      - name: Setup Python
        uses: actions/setup-python@v5
        with:
          python-version: ${{ matrix.python-version }}

      - name: Print Python Version
        run: python --version
Visual Example
With fail-fast: true
Job 3.10 ❌
Job 3.11 cancelled
Job 3.12 cancelled
With fail-fast: false
Job 3.10 ❌
Job 3.11 ✅
Job 3.12 ✅
Where fail-fast Must Be Written

It must be inside strategy, not outside.

Correct structure:

jobs:
  build:
    runs-on: ubuntu-latest

    strategy:
      fail-fast: false
      matrix:
        python-version: ["3.10","3.11","3.12"]
Other Important Matrix Options (Important for CI/CD)
Option	Purpose
fail-fast	Stop other jobs if one fails
matrix	Define combinations
include	Add extra job combinations
exclude	Remove combinations

✅ Example combinations

If you add OS + Python:

matrix:
  os: [ubuntu-latest, windows-latest]
  python-version: ["3.10","3.11","3.12"]

Total jobs:

2 OS × 3 Python = 6 jobs

✅ If you want, I can also show you 3 real GitHub Actions matrix tricks used in production CI/CD pipelines (these are usually asked in DevOps interviews).

name: Matrix Build

on:
  push:
    branches: [feature]

jobs:
  build:
    runs-on: ubuntu-latest
    strategy:
       fail-fast: true
       matrix:
         python-version: ["3.10", "3.11", "3.12"]

    steps:
      - name: Checkout repo
        uses: actions/checkout@v5

      - name: Setup Python
        uses: actions/setup-python@v5
        with:
          python-version: ${{ matrix.python-version }}

      - name: Print Python Version
        run: python --version explain in detail and simple way

Your GitHub Actions workflow creates a matrix build that runs the same job using multiple Python versions. I’ll explain it line by line in a simple way.

1️⃣ Workflow Name
name: Matrix Build

This sets the name of the workflow.

You will see this name in the GitHub Actions tab.

Example in GitHub UI:

Actions
 └── Matrix Build
2️⃣ Trigger Event
on:
  push:
    branches: [feature]

This defines when the workflow should run.

Meaning:

When someone pushes code

To the feature branch

Example:

git push origin feature

Then GitHub automatically starts the workflow.

3️⃣ Jobs Section
jobs:

A job is a group of steps that run on a machine.

A workflow can have multiple jobs, but here we only have one job.

4️⃣ Job Name
build:

This is the name of the job.

In GitHub Actions UI you will see something like:

build (3.10)
build (3.11)
build (3.12)

Because the matrix creates multiple versions.

5️⃣ Runner Machine
runs-on: ubuntu-latest

This tells GitHub which machine to use.

GitHub provides virtual machines (runners).

Here we use:

Ubuntu Linux

Possible runners:

ubuntu-latest

windows-latest

macos-latest

6️⃣ Strategy Section
strategy:

The strategy defines how jobs should run.

Here we are using matrix strategy.

Matrix means:

👉 Run the same job multiple times with different values.

7️⃣ Fail Fast
fail-fast: true

This controls what happens if one job fails.

When fail-fast: true

If one job fails:

3.10 ❌
3.11 cancelled
3.12 cancelled

GitHub stops the remaining jobs to save time.

If fail-fast: false

All jobs run even if one fails:

3.10 ❌
3.11 ✅
3.12 ✅
8️⃣ Matrix Definition
matrix:
  python-version: ["3.10", "3.11", "3.12"]

This creates multiple job versions.

GitHub will run one job per Python version.

Jobs created
Job	Python Version
Job 1	3.10
Job 2	3.11
Job 3	3.12

So 3 jobs run in parallel.

9️⃣ Steps Section
steps:

Steps are the actual commands executed inside the job.

Each job runs all steps sequentially.

🔟 Step 1 — Checkout Repository
- name: Checkout repo
  uses: actions/checkout@v5

This downloads your GitHub repository code into the runner.

Without this step, the runner does not have your project files.

This action:

actions/checkout

is an official GitHub action.

1️⃣1️⃣ Step 2 — Setup Python
- name: Setup Python
  uses: actions/setup-python@v5

This installs Python on the runner machine.

But we need the version from the matrix.

So we use:

with:
  python-version: ${{ matrix.python-version }}

${{ }} is a GitHub Actions expression.

matrix.python-version means:

Use the current Python version from the matrix

Example runs:

Job 1 → Python 3.10
Job 2 → Python 3.11
Job 3 → Python 3.12
1️⃣2️⃣ Step 3 — Run Command
- name: Print Python Version
  run: python --version

This runs a shell command inside the runner.

Command executed:

python --version

Output example:

Python 3.10.14
Python 3.11.9
Python 3.12.3
🔁 Full Workflow Execution

When you push code to feature branch:

git push origin feature

GitHub Actions will:

1️⃣ Start workflow Matrix Build

2️⃣ Create 3 parallel jobs

build (3.10)
build (3.11)
build (3.12)

3️⃣ Each job:

Runs on Ubuntu

Installs a Python version

Prints Python version

📊 Visual Pipeline
Push to feature branch
        │
        ▼
     Workflow
     Matrix Build
        │
        ▼
   ┌─────────────┬─────────────┬─────────────┐
   │  Job        │  Job        │  Job        │
   │ Python 3.10 │ Python 3.11 │ Python 3.12 │
   └─────────────┴─────────────┴─────────────┘
        │             │             │
        ▼             ▼             ▼
   Checkout Repo  Checkout Repo  Checkout Repo
        │             │             │
   Setup Python   Setup Python   Setup Python
        │             │             │
   Print Version  Print Version  Print Version
💡 Why Matrix Builds Are Useful

Real CI/CD pipelines use matrix builds for:

Testing multiple Python versions

Testing different OS

Testing multiple Node versions

Ensuring compatibility

Example:

Python + OS testing
OS	Python
Ubuntu	3.10
Ubuntu	3.11
Windows	3.10
Windows	3.11

Total jobs = 4

✅ If you want, I can also show you the professional matrix workflow used in real DevOps projects (with OS + Python + caching).

what other strategy are availble then can be use in real project and production

In GitHub Actions, strategy is used to control how jobs run.
In real projects and production CI/CD pipelines, developers mainly use Matrix Strategy with additional features.

The important options inside strategy are:

1️⃣ Matrix Strategy (Most Common)

Matrix allows running the same job with different configurations.

Example: testing multiple Python versions.

strategy:
  matrix:
    python-version: ["3.10", "3.11", "3.12"]
What happens

3 jobs run in parallel:

build (3.10)
build (3.11)
build (3.12)
Real Production Use

Testing compatibility across:

OS	Python
Ubuntu	3.10
Ubuntu	3.11
Windows	3.10
Windows	3.11
2️⃣ fail-fast

Controls whether other matrix jobs stop if one fails.

Example:

strategy:
  fail-fast: false
  matrix:
    python-version: ["3.10", "3.11", "3.12"]
Use in production

If you want to see which environments fail, keep jobs running.

Example:

3.10 ❌
3.11 ✅
3.12 ❌
3️⃣ include

Adds extra custom combinations to the matrix.

Example:

strategy:
  matrix:
    os: [ubuntu-latest, windows-latest]
    python-version: ["3.10", "3.11"]

    include:
      - os: macos-latest
        python-version: "3.12"
Jobs created
OS	Python
Ubuntu	3.10
Ubuntu	3.11
Windows	3.10
Windows	3.11
macOS	3.12
Real use

Sometimes you want special test environments.

4️⃣ exclude

Removes unwanted combinations from the matrix.

Example:

strategy:
  matrix:
    os: [ubuntu-latest, windows-latest]
    python-version: ["3.10", "3.11"]

    exclude:
      - os: windows-latest
        python-version: "3.11"
Jobs created
OS	Python
Ubuntu	3.10
Ubuntu	3.11
Windows	3.10

Windows + Python 3.11 is removed.

Real use

Sometimes certain combinations do not work.

Example:

Library not supported on Windows
5️⃣ Multi-Dimension Matrix (Very Common in Production)

You can combine multiple variables.

Example:

strategy:
  matrix:
    os: [ubuntu-latest, windows-latest]
    python-version: ["3.10", "3.11"]
    database: [mysql, postgres]
Total jobs
2 OS × 2 Python × 2 DB = 8 jobs

Used for full compatibility testing.

6️⃣ max-parallel

Limits how many jobs run at the same time.

Example:

strategy:
  max-parallel: 2
  matrix:
    python-version: ["3.10", "3.11", "3.12", "3.13"]
Behavior

Only 2 jobs run simultaneously.

Job1 + Job2 running
Job3 waits
Job4 waits
Real use

Used when:

Builds are heavy

Limited compute resources

Avoid API rate limits

7️⃣ continue-on-error (Advanced)

Allows certain matrix jobs to fail without failing the workflow.

Example:

continue-on-error: ${{ matrix.python-version == '3.12' }}

Meaning:

Python 3.12 failure will not fail pipeline

Used when testing experimental versions.

📊 Real Production Matrix Example

Example from real CI/CD pipelines:

strategy:
  fail-fast: false
  max-parallel: 3
  matrix:
    os: [ubuntu-latest, windows-latest]
    python-version: ["3.10", "3.11", "3.12"]

    exclude:
      - os: windows-latest
        python-version: "3.12"

Total jobs:

2 OS × 3 Python = 6
minus 1 excluded = 5 jobs
⭐ What Real Projects Usually Use

Most production pipelines combine:

matrix

fail-fast

include

exclude

max-parallel

Example projects:

Kubernetes

React

FastAPI

TensorFlow

✅ Simple rule

strategy
 ├─ matrix
 ├─ fail-fast
 ├─ include
 ├─ exclude
 └─ max-parallel

If you want, I can also show you a real GitHub Actions workflow from a production project (Python + Docker + testing) so you understand how companies actually use matrix strategy.
