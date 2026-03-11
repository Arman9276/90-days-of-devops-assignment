1️⃣ Pull Images from Docker Hub

Download the images nginx, ubuntu, and alpine.

docker pull nginx
docker pull ubuntu
docker pull alpine

Check if they downloaded:

docker images

Example output:

REPOSITORY   TAG       IMAGE ID       CREATED        SIZE
nginx        latest    2a7d...        2 weeks ago    187MB
ubuntu       latest    a1b2...        2 weeks ago    77MB
alpine       latest    c3d4...        7 days ago     7MB
2️⃣ List All Images and Note Sizes

Run:

docker images

Important columns:

Column	Meaning
REPOSITORY	Image name
TAG	Version
IMAGE ID	Unique identifier
CREATED	When it was built
SIZE	Image size

Example size comparison:

Image	Approx Size
nginx	~180 MB
ubuntu	~77 MB
alpine	~7 MB
3️⃣ Compare Ubuntu vs Alpine
Ubuntu Image

Full Linux distribution

Includes many packages

Larger size (~70-80MB)

Alpine Image

Minimal Linux distribution

Only essential packages

Uses musl libc instead of glibc

Very small (~5-7MB)

Why Alpine is Smaller

Reasons:

1️⃣ Minimal packages
2️⃣ BusyBox utilities instead of full GNU tools
3️⃣ Uses musl libc
4️⃣ Designed specifically for containers

So Alpine is commonly used for lightweight containers.

4️⃣ Inspect an Image

To see detailed information about an image:

docker inspect nginx

or

docker inspect ubuntu

Information you can see:

Image ID

Creation date

OS / architecture

Environment variables

Layers of the image

Default command

Container configuration

Working directory

Example useful command:

docker inspect alpine
5️⃣ Remove an Image

First list images:

docker images

Remove one image:

docker rmi alpine

Remove multiple:

docker rmi nginx ubuntu

Force remove (if container exists):

docker rmi -f alpine
✔️ Quick Summary (What you learned)
Task	Command
Pull images	docker pull nginx
List images	docker images
Inspect image	docker inspect nginx
Remove image	docker rmi alpine
