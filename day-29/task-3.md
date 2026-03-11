1. Run an Nginx Container and Access It in Browser

Run the Nginx web server container and map its port to your machine.

docker run -d -p 8080:80 --name mynginx nginx

Explanation:

-d → Run container in detached mode (background)

-p 8080:80 → Map host port 8080 to container port 80

--name mynginx → Give container a custom name

nginx → Image name

Open in Browser

Go to:

http://localhost:8080

or

http://127.0.0.1:8080

You should see the Nginx welcome page, which confirms the container is running.

2. Run Ubuntu Container in Interactive Mode

Start an Ubuntu container where you can interact with the shell.

docker run -it ubuntu

Explanation:

-i → Interactive mode

-t → Allocate terminal

ubuntu → Ubuntu image

Docker will download the Ubuntu image if it is not present.

You will see something like:

root@container_id:/#

Now you are inside the container.

Explore the Container

Try these commands:

ls
pwd
cat /etc/os-release
apt update

Example:

cat /etc/os-release

This shows the Ubuntu version running inside the container.

To exit:

exit
3. List All Running Containers
docker ps

Example output:

CONTAINER ID   IMAGE    COMMAND   STATUS   PORTS
abc123         nginx    ...       Up       0.0.0.0:8080->80/tcp

This shows:

Running containers

Container ID

Image name

Ports

4. List All Containers (Including Stopped)
docker ps -a

This shows:

Running containers

Stopped containers

Container history

Example:

CONTAINER ID   IMAGE    STATUS
abc123         nginx    Up 2 minutes
def456         ubuntu   Exited (0)
5. Stop a Container

Stop the running Nginx container.

docker stop mynginx

You can also use container ID:

docker stop abc123
6. Remove a Container

After stopping the container, remove it.

docker rm mynginx

Example with ID:

docker rm abc123
