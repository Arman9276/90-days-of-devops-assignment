1️⃣ Check Docker Disk Usage (Hint: docker system df)

Before cleaning, see how much space Docker is using.

docker system df

Example output:

TYPE            TOTAL     ACTIVE    SIZE
Images          6         2         1.2GB
Containers      4         1         200MB
Local Volumes   3         2         500MB
Build Cache     0         0         0B

This tells you:

How many images

How many containers

Total disk usage

2️⃣ Stop All Running Containers
docker stop $(docker ps -q)

Explanation:

docker ps -q → returns running container IDs

docker stop → stops them

Verify:

docker ps
3️⃣ Remove All Stopped Containers
docker container prune

Docker will ask:

Are you sure you want to continue? [y/N]

Press:

y

This removes all stopped containers.

4️⃣ Remove Unused Images
docker image prune -a

This removes:

dangling images

unused images not used by containers

5️⃣ Clean Everything at Once (Hint: docker system prune)

You can clean unused resources using:

docker system prune

This removes:

stopped containers

unused networks

dangling images

build cache

For deeper cleanup:

docker system prune -a
6️⃣ Check Disk Usage Again

Run again:

docker system df

You will see much less disk usage.

My View (Important DevOps Practice)

In real DevOps environments, engineers usually run:

docker system prune -a

because over time Docker stores:

old containers

unused images

build cache

These can easily take many GBs of disk space.

But be careful:

⚠️ docker system prune -a will remove images that are not currently used by containers.

So always check first with:

docker system df

✅ Short Notes Version (for assignment)

Docker cleanup helps remove unused containers and images to free disk space. The command docker system df shows Docker disk usage. Stopped containers can be removed using docker container prune, and unused images can be removed using docker image prune -a. The command docker system prune removes multiple unused Docker resources at once.
