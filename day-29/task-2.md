1. Update the System

First update your Ubuntu packages.

sudo apt update
sudo apt upgrade -y
2. Install Required Dependencies

Docker needs some packages for downloading and security.

sudo apt install ca-certificates curl gnupg lsb-release -y
3. Add Docker Official GPG Key
sudo mkdir -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
4. Add Docker Repository
echo \
"deb [arch=$(dpkg --print-architecture) \
signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

Update again:

sudo apt update
5. Install Docker Engine
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
6. Verify Docker Installation

Check the Docker version.

docker --version

Example output:

Docker version 26.x.x, build xxxx
7. Start and Enable Docker
sudo systemctl start docker
sudo systemctl enable docker

Check status:

sudo systemctl status docker
8. Run the Hello World Container

Run this command:

sudo docker run hello-world
9. What Happens When You Run This Command

When you run:

docker run hello-world

Docker performs these steps:

Docker client sends a request to Docker daemon.

Docker daemon checks if the hello-world image exists locally.

If not found, Docker pulls the image from Docker Hub.

Docker creates a container from the image.

The container runs a small program that prints a message.

The container then stops automatically.

Example output:

Hello from Docker!
This message shows that your installation appears to be working correctly.

This confirms:

✅ Docker client works
✅ Docker daemon works
✅ Docker can pull images from Docker Hub
✅ Docker can run containers

10. Run Docker Without sudo (Optional but Recommended)

Add your user to the Docker group:

sudo usermod -aG docker $USER

Then log out and log back in.

Now you can run:

docker run hello-world

without sudo.
