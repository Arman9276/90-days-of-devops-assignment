# Day 09 Challenge

## Users & Groups Created

* Users: tokyo, berlin, professor, nairobi
* Groups: developers, admins, project-team

---

## Group Assignments

* **developers:** tokyo, berlin
* **admins:** professor
* **project-team:** nairobi, tokyo

---

## Directories Created

* `/opt/team-workspace` → `775` (owner + group full access, others read/execute)
* Home directories for users → default permissions created with `useradd -m`

---

## Commands Used

* `sudo useradd -m tokyo`
* `sudo useradd -m berlin`
* `sudo useradd -m professor`
* `sudo useradd -m nairobi`
* `sudo groupadd developers`
* `sudo groupadd admins`
* `sudo groupadd project-team`
* `sudo usermod -aG developers tokyo`
* `sudo usermod -aG developers berlin`
* `sudo usermod -aG admins professor`
* `sudo usermod -aG project-team nairobi`
* `sudo usermod -aG project-team tokyo`
* `sudo mkdir -p /opt/team-workspace`
* `sudo chgrp project-team /opt/team-workspace`
* `sudo chmod 775 /opt/team-workspace`
* `id username`
* `ls -ld /opt/team-workspace`

---

## What I Learned

1. Users and groups help control access to files and shared directories in Linux systems.
2. `usermod -aG` safely adds users to groups without removing existing memberships.
3. Proper group ownership and permissions (like `775`) allow team collaboration while keeping systems secure.

