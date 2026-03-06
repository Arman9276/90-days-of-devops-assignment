# Day 11 Challenge

## Files & Directories Created

* devops-file.txt
* team-notes.txt
* project-config.yaml
* app-logs/
* heist-project/
* heist-project/vault/
* heist-project/plans/
* heist-project/vault/gold.txt
* heist-project/plans/strategy.conf

## Ownership Changes

* devops-file.txt: arman:arman → tokyo:arman → berlin:arman
* team-notes.txt: arman:arman → arman:heist-team
* project-config.yaml: arman:arman → professor:heist-team
* app-logs/: arman:arman → berlin:heist-team
* heist-project/ (recursive): arman:arman → professor:planners
* heist-project/vault/gold.txt: arman:arman → professor:planners
* heist-project/plans/strategy.conf: arman:arman → professor:planners

## Commands Used

ls -l
touch devops-file.txt
touch team-notes.txt
touch project-config.yaml
mkdir app-logs
mkdir -p heist-project/vault
mkdir -p heist-project/plans
touch heist-project/vault/gold.txt
touch heist-project/plans/strategy.conf
sudo useradd tokyo
sudo useradd berlin
sudo groupadd heist-team
sudo groupadd planners
sudo chown tokyo devops-file.txt
sudo chown berlin devops-file.txt
sudo chgrp heist-team team-notes.txt
sudo chown professor:heist-team project-config.yaml
sudo chown berlin:heist-team app-logs
sudo chown -R professor:planners heist-project/
ls -lR heist-project/

## What I Learned

1. File ownership in Linux has two parts: user (owner) and group, each with separate permissions.
2. The `chown` command can change both owner and group together using owner:group syntax.
3. The recursive flag (-R) allows ownership changes to apply to entire directory structures, which is useful in DevOps project setups.

