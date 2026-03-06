1️⃣ String Comparisons

Used inside [ ] for text checks.
------------------------------------------------------------------------------------
STR="docker"

[ "$STR" = "docker" ]   # equal
[ "$STR" != "nginx" ]   # not equal
[ -z "$STR" ]           # empty string
[ -n "$STR" ]           # not empty
------------------------------------------------------------------------------------

Always quote variables to avoid errors.

2️⃣ Integer Comparisons

Numeric checks using test operators.
------------------------------------------------------------------------------------
NUM=10

[ "$NUM" -eq 10 ]   # equal
[ "$NUM" -ne 5 ]    # not equal
[ "$NUM" -lt 20 ]   # less than
[ "$NUM" -gt 5 ]    # greater than
[ "$NUM" -le 10 ]   # less or equal
[ "$NUM" -ge 8 ]    # greater or equal

Use these instead of = for numbers.
------------------------------------------------------------------------------------

3️⃣ File Test Operators

Check file or directory properties.
------------------------------------------------------------------------------------
FILE="/etc/passwd"

[ -f "$FILE" ]   # file exists
[ -d "/tmp" ]    # directory exists
[ -e "$FILE" ]   # exists (file/dir)
[ -r "$FILE" ]   # readable
[ -w "$FILE" ]   # writable
[ -x "$FILE" ]   # executable
[ -s "$FILE" ]   # not empty
------------------------------------------------------------------------------------

Common in automation scripts.

4️⃣ if / elif / else Syntax

Basic decision making structure.
------------------------------------------------------------------------------------
SERVICE="docker"

if systemctl is-active "$SERVICE" >/dev/null; then
    echo "Running"
elif systemctl is-enabled "$SERVICE" >/dev/null; then
    echo "Enabled but not running"
else
    echo "Not installed"
fi
------------------------------------------------------------------------------------

then starts the action block.

fi ends the condition.

5️⃣ Logical Operators

Combine multiple conditions.
------------------------------------------------------------------------------------
USER="root"
DIR="/tmp"

[ "$USER" = "root" ] && echo "Admin user"

[ -d "$DIR" ] || echo "Directory missing"

[ ! -f "/tmp/test.txt" ] && echo "File not found"
------------------------------------------------------------------------------------
&& → run if previous succeeds

|| → run if previous fails

! → NOT condition

6️⃣ Case Statements (case ... esac)

Cleaner alternative to many if statements.
------------------------------------------------------------------------------------
read -p "Enter environment (dev/stage/prod): " ENV

case "$ENV" in
    dev)
        echo "Development mode"
        ;;
    stage)
        echo "Staging mode"
        ;;
    prod)
        echo "Production mode"
        ;;
    *)
        echo "Unknown environment"
        ;;
esac
------------------------------------------------------------------------------------

Each pattern ends with ;;.

* acts as default case.


