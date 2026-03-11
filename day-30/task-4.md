Task 4: Working with Running Containers

We will use an Nginx container for this task.

1️⃣ Run an Nginx Container in Detached Mode

Detached mode means the container runs in the background.

docker run -d --name nginx-container -p 8080:80 nginx

Explanation:

Option	Meaning
-d	Run container in background
--name	Give container a custom name
-p 8080:80	Map port 8080 (host) → 80 (container)

Check running containers:

docker ps

Open browser and test:

http://localhost:8080

You should see the Nginx welcome page.

2️⃣ View Container Logs

Logs show what the container is doing.

docker logs nginx-container

Example logs:

172.17.0.1 - - [11/Mar/2026:12:10:01] "GET / HTTP/1.1" 200 615
3️⃣ View Real-Time Logs (Follow Mode)

Follow logs live like tail -f.

docker logs -f nginx-container

Now refresh your browser and you will see live requests appearing.

Stop log view with:

Ctrl + C
4️⃣ Exec Into the Container (Interactive Shell)

Enter the container like a mini Linux system.

docker exec -it nginx-container /bin/bash

If bash is not available:

docker exec -it nginx-container /bin/sh

Now explore the filesystem:

ls
cd /usr
cd /etc/nginx
ls

Exit the container:

exit
5️⃣ Run a Single Command Inside the Container

You can run a command without entering the container.

Example:

docker exec nginx-container ls /

Another example:

docker exec nginx-container nginx -v

This runs the command and immediately returns the output.

6️⃣ Inspect the Container

This shows detailed information about the container.

docker inspect nginx-container

It returns a large JSON output.

Find Important Information
Container IP Address
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' nginx-container

Example output:

172.17.0.2
Port Mapping
docker port nginx-container

Example:

80/tcp -> 0.0.0.0:8080

Meaning:

Host:8080 → Container:80
Mounts / Volumes
docker inspect nginx-container | grep Mounts -A 5

This shows if any volumes or directories are attached.

Check Container Status
docker ps

Stop the container when finished:

docker stop nginx-container

Remove it:

docker rm nginx-container
Quick Command Summary
Task	Command
Run container	docker run -d --name nginx-container -p 8080:80 nginx
View logs	docker logs nginx-container
Real-time logs	docker logs -f nginx-container
Enter container	docker exec -it nginx-container /bin/bash
Run command inside	docker exec nginx-container ls /
Inspect container	docker inspect nginx-container
