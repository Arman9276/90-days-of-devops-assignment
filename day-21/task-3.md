🔁 Bash Loops — Quick Cheat Sheet
1️⃣ for Loop (List-Based)

Used to iterate over items, files, or words.
-----------------------------------------------------------
for name in nginx docker redis; do
    echo "Service: $name"
done
-----------------------------------------------------------

👉 Best for known lists or glob patterns.

2️⃣ for Loop (C-Style)

Similar to C/Java syntax — useful for counters.
-----------------------------------------------------------
for ((i=1; i<=5; i++)); do
    echo "Count: $i"
done
-----------------------------------------------------------

👉 Great for numeric iteration.

3️⃣ while Loop

Runs while a condition is true.
-----------------------------------------------------------
count=1
while [ $count -le 3 ]; do
    echo "Number $count"
    ((count++))
done
-----------------------------------------------------------

👉 Common for reading input or waiting for conditions.

4️⃣ until Loop

Runs until a condition becomes true (opposite of while).
-----------------------------------------------------------
num=1
until [ $num -gt 3 ]; do
    echo "Num: $num"
    ((num++))
done
-----------------------------------------------------------

👉 Think: loop until success happens.

5️⃣ Loop Control — break and continue

Control loop execution flow.
-----------------------------------------------------------
for i in {1..5}; do
    if [ $i -eq 3 ]; then
        continue   # skip 3
    fi
    if [ $i -eq 5 ]; then
        break      # stop loop
    fi
    echo "$i"
done
-----------------------------------------------------------

continue → skip current iteration

break → exit loop completely

6️⃣ Looping Over Files

Process matching files using globbing.
-----------------------------------------------------------
for file in *.log; do
    echo "Processing $file"
done
-----------------------------------------------------------

👉 Very common in log cleanup scripts.

7️⃣ Looping Over Command Output (while read)

Safely read lines from commands or files.
-----------------------------------------------------------
cat users.txt | while read line; do
    echo "User: $line"
done
-----------------------------------------------------------

Better (avoid useless cat):
-----------------------------------------------------------
while read line; do
    echo "User: $line"
done < users.txt
-----------------------------------------------------------


