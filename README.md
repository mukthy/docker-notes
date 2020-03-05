# Docker Commands

--------------------------
## Version Check:

`docker version`

## Run a docker image:

`docker run [image]`

*Example : docker run docker/whalesay cowsay Hello-World*

## List Containers:

Show Running containers: 

`docker ps`

Show Running/stopped containers : 

`docker ps -a`

## Stop Containers:

To list : 

`docker ps -a`

To Stop : 

`docker stop [name of container]`

*Example : docker stop silly_sammet*

## Remove the stopped Containers:

List the containers: 

`docker ps -a`

To remove container: 

`docker rm [container name]`

*Example : docker rm silly_sammet*

## List of Images:

`docker images`

## Remove images:

`docker rmi [image name]`

## Pull the Image not to Run:

`docker pull [image name]`

## To see the conents inside of docker container:

`docker exec [docker image name] cat /etc/hosts`

## Docker - Run Attach and Detach:

Run Docker in foreground : 

`docker run kodekloud/simple-webapp`

Run Docker in background (detach) : 

`docker run -d kodekloud/simple-webapp`

Attach to the Docker running in background : 

`docker attach [container ID]`

## To login automatically in any Image:

`docker run -it centos bash`

## To login to a running container:

`docker exec -it [container ID] bash`

## Tags:

If we want to install a specific version of a redis, then specify the version:

`docker run -d redis:4.0`

By default "docker run -d redis" runs a latest version with its tag as "latest".

## Run STDIN (Standard Input)

To run the docker in an interactive mode :

`docker run -i ubuntu`

To run the docker in an interactive mode with terminal :

`docker run -it ubuntu`

## Port Mapping

Since the docker IP is internal and cannot be accessed at the host's browser.
To access the application on the host's browser, we need to port map it.

`docker run -p [host port]:[container port] image_name`
`docker run -p 8000:5000 kodekloud/simple-webapp`

## Volume Mapping

If we run a mysql docker then the db will be saved in the /var/lib/mysql inside the container.
If we stop and remove the container the data will be deleted with it.
To retain the data even if the container is removed we need to map the data dir to host's dir.

`docker run -v [host's dir to save]:[container dir with data] image_name`

`docker run -v /opt/datadir:/var/lib/mysql mysql`

## Docker Inspect

To inpect the container :

`docker inspect container_name`

`docker inspect bold_tu`

## To change the name of the Container:

`docker run --name mysql mysql`

## Container Logs

To show the Standard Output of the container :

`docker logs container_ID`

## Environment Varialble

If an application has an environment variable to change the color of homepage.

`docker run -e APP_COLOR=blue simple-webapp-color`

To find the envronment variables:

`docker inspect container_ID`

*Example : docker run -d --name mysql-db -e MYSQL_ROOT_PASSWORD=db_pass123 mysql*

## Creating a Docker Image

First create a docker and run the application manually and check what are the steps involved in it.

Below commands are used in setting up the docker with flask web-server manually and host an application.

`apt-get update`

`apt-get install python python-pip -y`

`pip install flask`

`pip install flask-mysql`

`Create/Code application to source dir /opt/app.py`

`FLASK_APP=/opt/app.py flask run --host=0.0.0.0`

**Creating the Dockerfile for the Docker image**

> nano Dockerfile

> FROM ubuntu

> RUN apt-get update

> RUN apt-get install python python-pip -y

> RUN pip install flask

> RUN pip install flask-mysql

> COPY app.py /opt/app.py

> ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0

Commands to give a tag and build the docker image:

`docker build . -t [image_name]`

*Example : docker build . -t natz-app*

Command to give a repo/username with image name:

`docker build . -t repo/image_name`

*Example : docker build . -t mukthy/natz-app*

Command to push the image to your docker hub repository:

`docker login`

`docker push repo/image_name`

*Example : docker push mukthy/natz-app*

## Commands and Entrypoints

In order to stop a ubuntu container from getting EXIT right after launch, we can make changes in the Dockerfile or create our own Dockerfile.

The CMD in the docker file decides what the container has to execute after the launch.
By default the ubuntu has bash as CMD which is not a service, rather it is a terminal to take input.

To stop the Ubuntu container from geting Exit we can append the CMD during the initialization of the container.

`docker run ubuntu sleep 5`

We can mention the sleep 5 in the Dockerfile such as:

`CMD sleep 5`

If we want to just enter the parameter such as 5 or 10 at the initialization of the container, we can use ENTRYPOINT in the Dockerfile instead of CMD such as:

`ENTRYPOINT sleep`

`ENTRYPOINT ["sleep"]`

During initialization we have to run like as below:

`docker run ubuntu-sleeper 10`  

In order to avoid the missing operand error we need to mention both the ENTRYPOINT and CMD as given below in the Dockerfile.

`FROM ubuntu`

`ENTRYPOINT ["sleep"]`

`CMD ["5"]`

*Example if we enter the command as docker run ubuntu-sleeper 10*

The 10 is appended by the CMD mentioned in the Dokerfile and the container will be in sleep for 10 sec.

To modify the entry point of the Dockerfile:

`docker run --entrypoint sleep2.0 ubuntu-sleeper 10`