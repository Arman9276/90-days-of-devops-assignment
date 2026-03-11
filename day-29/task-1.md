Task 1: What is Docker
1. What is a Container and Why Do We Need Them?

A container is a lightweight package that contains:

Application code

Runtime

Libraries

Dependencies

System tools

Everything required to run the application.

This means the application will run the same way on any machine.

Why containers are needed

Before containers, developers faced the problem:

“It works on my machine but not on yours.”

Containers solve this by packaging the entire environment with the application.

Benefits of Containers

Consistent environment across systems

Fast startup

Lightweight compared to VMs

Easy to deploy and scale

Better resource utilization

Example:
A developer builds an app on Ubuntu and sends the container to a production server. The app will run exactly the same.

2. Containers vs Virtual Machines
4
Feature	Containers	Virtual Machines
Virtualization Type	OS-level	Hardware-level
Size	Small (MBs)	Large (GBs)
Boot Time	Seconds	Minutes
OS	Share host OS kernel	Each VM has its own OS
Performance	Faster	Slower
Resource Usage	Low	High
Simple Explanation

Virtual Machine

Runs a full operating system.

Needs more RAM and storage.

Container

Shares the host OS kernel.

Only packages the application and dependencies.

Example:

VM structure:

Hardware
Hypervisor
Guest OS
Application

Container structure:

Hardware
Host OS
Docker Engine
Containers
3. Docker Architecture
4

Docker uses a client-server architecture.

Main components:

1. Docker Client

The Docker client is the command-line tool used by users.

Example commands:

docker build
docker pull
docker run
docker ps

The client sends commands to the Docker daemon.

2. Docker Daemon (dockerd)

The Docker daemon runs in the background and:

Builds images

Runs containers

Manages networks

Manages storage

It is the core engine of Docker.

3. Docker Images

A Docker image is a template used to create containers.

It contains:

Application code

Libraries

Dependencies

Environment configuration

Example images:

nginx

ubuntu

alpine

You create images using a Dockerfile.

4. Docker Containers

A container is a running instance of a Docker image.

Example:

docker run nginx

This creates a container from the nginx image.

Containers are:

Isolated

Lightweight

Portable

5. Docker Registry

A Docker registry is a place where Docker images are stored.

The most common registry is:

Docker Hub

Example:

docker pull nginx

Docker downloads the image from the registry.

You can also create private registries.

4. Docker Architecture (In My Own Words)

Docker works in a client-server model.

The Docker client sends commands.

The Docker daemon receives the commands.

The daemon downloads images from the Docker registry if needed.

The daemon creates and runs containers from those images.

Containers run applications in isolated environments on the host machine.

Simple flow:

User
  ↓
Docker Client (CLI)
  ↓
Docker Daemon
  ↓
Docker Images
  ↓
Docker Containers
  ↓
Application Runs

✅ One-line summary

Docker allows developers to package applications into containers so they run consistently across different environments.
