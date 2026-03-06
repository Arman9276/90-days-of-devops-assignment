1️⃣ Shebang (#!/bin/bash)

What it does: Tells Linux which interpreter should run the script
---------------------------------------------------------------
#!/bin/bash
echo "Hello World"
---------------------------------------------------------------

Ensures script runs with Bash even if another shell is default.

2️⃣ Running a Script

Make executable + run in different ways.
---------------------------------------------------------------
chmod +x script.sh     # give execute permission
./script.sh            # run using shebang
bash script.sh         # run with bash explicitly
---------------------------------------------------------------
./script.sh uses shebang.

bash script.sh ignores execute permission.

3️⃣ Comments

Used to explain code or disable lines.
-----------------------------------------------------------------
# This is a single-line comment

echo "Hello"  # Inline comment
------------------------------------------------------------------
Bash ignores anything after #.

4️⃣ Variables

Store and reuse values.
--------------------------------------------------------------------
NAME="Arman"
echo $NAME
echo "$NAME"
echo '$NAME'
--------------------------------------------------------------------

$NAME → expands variable

"$NAME" → safe quoting (recommended)

'$NAME' → literal text (no expansion)

5️⃣ Reading User Input (read)

Get input from keyboard.
---------------------------------------------------------------------
read -p "Enter your name: " USER
echo "Hello $USER"
---------------------------------------------------------------------
-p shows prompt text.

Input is stored in variable.
.
6️⃣ Command-Line Arguments

Values passed when running a script.
--------------------------------------------------------------------
#!/bin/bash
echo "Script name: $0"
echo "First arg: $1"
echo "Total args: $#"
echo "All args: $@"
echo "Last exit code: $?"
--------------------------------------------------------------------

--------------------------------------------------------------------
Run:

bash demo.sh nginx docker
--------------------------------------------------------------------

$0 → script name

$1, $2 → arguments

$# → number of arguments

$@ → all arguments

$? → exit status of last command
