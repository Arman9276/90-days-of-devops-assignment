Task 3: Container Lifecycle

We will use an nginx container as an example.

1️⃣ Create a Container (Without Starting)

This creates a container but does not start it.

docker create --name mycontainer nginx

Check status:

docker ps -a

State you will see:

Created

Meaning: container exists but is not running yet.

2️⃣ Start the Container

Start the container:

docker start mycontainer

Check:

docker ps -a

State:

Up

Meaning: container is running.

3️⃣ Pause the Container

Pause the container processes.

docker pause mycontainer

Check status:

docker ps -a

State:

Paused

Meaning: container is frozen but still running in memory.

4️⃣ Unpause the Container

Resume the container.

docker unpause mycontainer

Check:

docker ps -a

State:

Up

Meaning: container resumed normally.

5️⃣ Stop the Container

Gracefully stop the container.

docker stop mycontainer

Check:

docker ps -a

State:

Exited

Meaning: container stopped but still exists.

6️⃣ Restart the Container

Restart the stopped container.

docker restart mycontainer

Check:

docker ps -a

State:

Up

Meaning: container started again.

7️⃣ Kill the Container

Immediately stop the container (force stop).

docker kill mycontainer

Check:

docker ps -a

State:

Exited

Difference from stop:

stop = graceful shutdown

kill = immediate termination

8️⃣ Remove the Container

Delete the container completely.

docker rm mycontainer

Check again:

docker ps -a

Container will no longer appear in the list.

Container Lifecycle Flow
Create
   ↓
Start
   ↓
Running
   ↓
Pause ↔ Unpause
   ↓
Stop / Kill
   ↓
Exited
   ↓
Remove
Commands Summary
Action	Command
Create container	docker create --name mycontainer nginx
Start container	docker start mycontainer
Pause	docker pause mycontainer
Unpause	docker unpause mycontainer
Stop	docker stop mycontainer
Restart	docker restart mycontainer
Kill	docker kill mycontainer
Remove	docker rm mycontainer

✅ DevOps Tip:
Most engineers directly create and start a container using:

docker run nginx

Because docker run = create + start in one command.
