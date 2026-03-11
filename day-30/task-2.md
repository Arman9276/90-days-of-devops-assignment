1️⃣ Run the Command

Run this command:

docker image history nginx

Example output:

IMAGE          CREATED        CREATED BY                                      SIZE
<image-id>     2 weeks ago    /bin/sh -c #(nop)  CMD ["nginx" "-g" "daemon…"]  0B
<image-id>     2 weeks ago    /bin/sh -c #(nop)  EXPOSE 80                     0B
<image-id>     2 weeks ago    /bin/sh -c #(nop)  ENTRYPOINT ["/docker-entry…"] 0B
<image-id>     2 weeks ago    /bin/sh -c apt-get update && apt-get install…    45MB
<image-id>     2 weeks ago    /bin/sh -c #(nop) ADD file:abc123...             120MB

You will see several columns:

Column	Meaning
IMAGE	Layer ID
CREATED	When layer was created
CREATED BY	Command used to create the layer
SIZE	Size of that layer
2️⃣ Why Some Layers Show 0B

Some layers show 0B because they only contain metadata changes, not actual files.

Examples:

CMD

ENTRYPOINT

EXPOSE

ENV

These instructions do not add files, so they have 0B size.

Layers that install packages or copy files will have actual sizes.

Example:

RUN apt-get install nginx

This adds files → so it has MB size.

3️⃣ What Are Docker Image Layers?

A Docker image is built from multiple read-only layers stacked together.

Each command in a Dockerfile creates a new layer.

Example Dockerfile:

FROM ubuntu
RUN apt-get update
RUN apt-get install nginx
COPY app /app
CMD ["nginx"]

Layers created:

Layer 1 → Ubuntu base image
Layer 2 → apt-get update
Layer 3 → install nginx
Layer 4 → copy app files
Layer 5 → CMD instruction
4️⃣ Why Docker Uses Layers

Docker uses layers for efficiency and speed.

1️⃣ Faster builds

If one layer changes, Docker only rebuilds that layer.

Example:

Layer 1  ubuntu        (cached)
Layer 2  install nginx (cached)
Layer 3  copy app      (rebuild only this)
2️⃣ Saves disk space

Layers are shared between images.

Example:

Image A → ubuntu + python
Image B → ubuntu + nginx

Both share the same ubuntu base layer.

3️⃣ Faster downloads (pull)

When pulling images:

Docker downloads only missing layers.

Example:

If you already have the Ubuntu layer locally, Docker downloads only the new layers.

5️⃣ Simple Visualization

Think of layers like this stack:

Application files
-----------------
Nginx installation
-----------------
Package updates
-----------------
Ubuntu base OS

All layers together create the final Docker image.

✔ Short Notes Answer (for writing):

Docker images are built using multiple read-only layers. Each instruction in a Dockerfile creates a new layer. Layers store only the changes made in that step. Docker uses layers to improve build speed, reduce storage usage, and allow images to share common components. Some layers show 0B because they only contain metadata instructions like CMD or ENV.
