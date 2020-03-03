# Docker Commands

--------------------------
## Version Check:

> docker version

## Run a docker image:

> docker run [image]

Example : docker run docker/whalesay cowsay Hello-World

## List Containers:

Show Running containers: 

> docker ps

Show Running/stopped containers : 

> docker ps -a

## Stop Containers:

To list : 

> docker ps -a

To Stop : 

> docker stop [name of container]

Example : docker stop silly_sammet

## Remove the stopped Containers:

List the containers: 

> docker ps -a

To remove container: 

> docker rm [container name]

Example : docker rm silly_sammet

## List of Images:

> docker images

## Remove images:

> docker rmi [image name]

## Pull the Image not to Run:

> docker pull [image name]

## To see the conents inside of docker container:

> docker exec [docker image name] cat /etc/hosts

## Docker - Run Attach and Detach:

Run Docker in foreground : 

> docker run kodekloud/simple-webapp

Run Docker in background (detach) : 

> docker run -d kodekloud/simple-webapp

Attach to the Docker running in background : 

> docker attach [container ID]

## To login automatically in any Image:

> docker run -it centos bash

## To login to a running container:

> docker exec -it [container ID] bash

## Tags:

If we want to install a specific version of a redis, then specify the version:

> docker run -d redis:4.0

By default "docker run -d redis" runs a latest version with its tag as "latest".

## Run STDIN (Standard Input)

To run the docker in an interactive mode :

> docker run -i ubuntu

To run the docker in an interactive mode with terminal :

> docker run -it ubuntu

## Port Mapping

Since the docker IP is internal and cannot be accessed at the host's browser.
To access the application on the host's browser, we need to port map it.

> docker run -p [host port]:[container port] image_name
> docker run -p 8000:5000 kodekloud/simple-webapp

## Volume Mapping

If we run a mysql docker then the db will be saved in the /var/lib/mysql inside the container.
If we stop and remove the container the data will be deleted with it.
To retain the data even if the container is removed we need to map the data dir to host's dir.

> docker run -v [host's dir to save]:[container dir with data] image_name
> docker run -v /opt/datadir:/var/lib/mysql mysql

## Docker Inspect

To inpect the container :

> docker inspect container_name
> docker inspect bold_tu

## To change the name of the Container:

> docker run --name mysql mysql

## Container Logs

To show the Standard Output of the container :

> docker logs container_ID

## Environment Varialble

If an application has an environment variable to change the color of homepage.

> docker run -e APP_COLOR=blue simple-webapp-color

To find the envronment variables:
> docker inspect container_ID

`Example : docker run -d --name mysql-db -e MYSQL_ROOT_PASSWORD=db_pass123 mysql`

