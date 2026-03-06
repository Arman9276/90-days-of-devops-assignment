# Day 10 Challenge

## Files Created

* devops.txt
* notes.txt
* script.sh
* project/ (directory)

---

## Permission Changes

### script.sh

* **Before:** `-rw-r--r--` (not executable)
* **After:** `-rwxr-xr-x` (made executable using chmod +x)

### devops.txt

* **Before:** `-rw-r--r--`
* **After:** `-r--r--r--` (read-only for everyone)

### notes.txt

* **Before:** `-rw-r--r--`
* **After:** `-rw-r-----` (640 → owner rw, group r, others none)

### project/

* **Created with:** `drwxr-xr-x` (755 permissions)

---

## Commands Used

* `touch devops.txt`
* `echo "This is my DevOps notes file." > notes.txt`
* `vim script.sh`
* `ls -l`
* `chmod +x script.sh`
* `chmod a-w devops.txt`
* `chmod 640 notes.txt`
* `mkdir project`
* `chmod 755 project`
* `head -n 5 /etc/passwd`
* `tail -n 5 /etc/passwd`
* `cat notes.txt`

---

## What I Learned

1. Linux file permissions use the format **rwxrwxrwx** divided into owner, group, and others.
2. `chmod` can modify permissions using symbolic (`+x`, `a-w`) or numeric (`640`, `755`) methods.
3. Missing write or execute permissions causes **Permission denied** errors when editing or running files.

