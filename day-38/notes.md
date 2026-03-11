Task 1: Key-Value Pairs

Create person.yaml that describes yourself with:

    name
    role
    experience_years
    learning (a boolean)

Verify: Run cat person.yaml — does it look clean? No tabs?

Create a YAML file called person.yaml with simple key–value pairs. YAML uses spaces (not tabs) and key: value format.

1️⃣ Create the file
nano person.yaml
2️⃣ Add this content (example)
name: Arman Narsinh
role: DevOps Learner
experience_years: 0
learning: true

Explanation:

name → your name

role → what you do (student / DevOps learner / developer)

experience_years → number of years of experience

learning → true or false (boolean)

⚠️ Important YAML rules:

Use spaces only (no tabs)

Format must be key: value

No extra characters

3️⃣ Save the file

In nano:

CTRL + O  → Enter
CTRL + X
4️⃣ Verify the file

Run:

cat person.yaml

Expected output:

name: Arman Narsinh
role: DevOps Learner
experience_years: 0
learning: true

If it shows clean like this → ✅ YAML file is correct.

If you want, I can also show you Task 2 (Lists in YAML) which is usually the next DevOps YAML exercise.

Task 2: Lists

Add to person.yaml:

    tools — a list of 5 DevOps tools you know or are learning
    hobbies — a list using the inline format [item1, item2]

Write in your notes: What are the two ways to write a list in YAML?

You need to add lists to your existing person.yaml file.

1️⃣ Open the file
nano person.yaml
2️⃣ Updated person.yaml

Example:

name: Arman Narsinh
role: DevOps Learner
experience_years: 0
learning: true

tools:
  - Docker
  - Kubernetes
  - Git
  - Jenkins
  - Terraform

hobbies: [coding, learning-devops, watching-tech-videos]
3️⃣ Explanation

tools → block list format

tools:
  - Docker
  - Kubernetes
  - Git

Each item starts with -.

hobbies → inline list format

hobbies: [coding, learning-devops, watching-tech-videos]

Items are written inside square brackets.

4️⃣ Verify the file

Run:

cat person.yaml
Answer for your notes

Two ways to write a list in YAML:

1️⃣ Block Style (dash format)

tools:
  - Docker
  - Git
  - Kubernetes

2️⃣ Inline Style (square brackets)

tools: [Docker, Git, Kubernetes]

If you want, I can also show Task 3 (Nested YAML / Maps inside YAML) — this is usually the next important DevOps YAML concept used in Kubernetes manifests.

Task 3: Nested Objects

Create server.yaml that describes a server:

    server with nested keys: name, ip, port
    database with nested keys: host, name, credentials (nested further: user, password)

Verify: Try adding a tab instead of spaces — what happens when you validate it?
1️⃣ Create the file
nano server.yaml
2️⃣ Add this YAML content
server:
  name: devops-server
  ip: 192.168.1.10
  port: 8080

database:
  host: localhost
  name: devops_db
  credentials:
    user: admin
    password: strongpassword
3️⃣ Explanation

This YAML contains nested objects (maps).

Level 1

server:
database:

Level 2

server:
  name:
  ip:
  port:

Level 3 (nested inside database)

database:
  credentials:
    user:
    password:

Indentation (spaces) creates the hierarchy.

4️⃣ Verify the file

Run:

cat server.yaml

Expected output:

server:
  name: devops-server
  ip: 192.168.1.10
  port: 8080

database:
  host: localhost
  name: devops_db
  credentials:
    user: admin
    password: strongpassword
What happens if you use a TAB instead of spaces?

YAML does not allow tabs for indentation.

If you validate the file (for example using yamllint or a YAML parser), you will get an error like:

found character '\t' that cannot start any token

or

syntax error: tabs are not allowed in YAML
Why?

YAML strictly requires spaces for indentation to keep the structure consistent.

✔ Correct

(two spaces before keys)

❌ Incorrect

(tab before keys)

✅ Key YAML rule:
Always use spaces (usually 2 spaces) for indentation, never tabs.

If you want, I can also show you Task 4: YAML used in Kubernetes (Pod YAML) which is the real DevOps use case of everything you just learned.

Task 4: Multi-line Strings

In server.yaml, add a startup_script field using:

    The | block style (preserves newlines)
    The > fold style (folds into one line)

Write in your notes: When would you use | vs >?

You need to add a multi-line string in server.yaml using two YAML styles.

1️⃣ Update server.yaml

Open the file:

nano server.yaml

Add these fields at the bottom:

server:
  name: devops-server
  ip: 192.168.1.10
  port: 8080

database:
  host: localhost
  name: devops_db
  credentials:
    user: admin
    password: strongpassword

startup_script_literal: |
  echo "Starting server"
  sudo systemctl start nginx
  echo "Server started"

startup_script_folded: >
  echo "Starting server"
  sudo systemctl start nginx
  echo "Server started"
2️⃣ Explanation
1. | Literal Block Style
startup_script_literal: |
  echo "Starting server"
  sudo systemctl start nginx
  echo "Server started"

✔ Preserves line breaks exactly

Output becomes:

echo "Starting server"
sudo systemctl start nginx
echo "Server started"
2. > Folded Style
startup_script_folded: >
  echo "Starting server"
  sudo systemctl start nginx
  echo "Server started"

✔ Lines are merged into one line

Output becomes:

echo "Starting server" sudo systemctl start nginx echo "Server started"
3️⃣ Verify the file
cat server.yaml
📝 Answer for your notes

When to use | vs > in YAML

Use | (Literal Style) when:

You want to preserve line breaks

Writing scripts

Writing configuration blocks

Writing logs or commands

Example: Kubernetes startup scripts

Use > (Folded Style) when:

You want the text to become one long line

Writing long messages or descriptions

Example: long descriptions in config files

✅ Simple rule

| → keep line breaks

> → fold into a single line

Task 5: Validate Your YAML

    Install yamllint or use an online validator
    Validate both your YAML files
    Intentionally break the indentation — what error do you get?
    Fix it and validate again
Task 5: Validate Your YAML
1️⃣ Install yamllint (YAML validator)

On Ubuntu run:

sudo apt update
sudo apt install yamllint -y

Check installation:

yamllint --version
2️⃣ Validate your YAML files

You created:

person.yaml

server.yaml

Run:

yamllint person.yaml
yamllint server.yaml

If everything is correct, you will see no errors or only style warnings.

Example:

person.yaml
  1:1       warning  missing document start "---"  (document-start)

That is only a warning, not an error.

3️⃣ Intentionally break indentation

Example incorrect YAML

server:
 name: devops-server
  ip: 192.168.1.10
 port: 8080

Here indentation is inconsistent.

Now validate:

yamllint server.yaml

Example error:

server.yaml
  3:3       error    wrong indentation: expected 2 but found 1

or

syntax error: mapping values are not allowed here
4️⃣ Fix the indentation

Correct version:

server:
  name: devops-server
  ip: 192.168.1.10
  port: 8080

Validate again:

yamllint server.yaml

Now it should show no errors.
