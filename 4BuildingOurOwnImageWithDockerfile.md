Add a dockerfile to your node application
# all these commands are used for image setup.

FROM node 
# FROM: build image up on another base image that either exists on your system or is there on docker hub with the given name

WORKDIR /app
# **
# ALl subsequent commands will be executed within the /app 

COPY . /app

# COPY path1 path2  The first path is the source path where the files(code) live ,and which should be added in 
# the image(excluding the Dockerfile).
# If you specify a '.' , it means the path is same as the path where Dockerfile is present.
# The second path is the path inside the image where those should be stored.
# Every image (also every container based on the image) has its own internal filesystem which is totalyy detached from 
# your file system on your system.It is hidden away inside of the docker container.
# It is recommended to not use root folder in docker container for this.Should use some sub folder.Here we are naming it
# as /app
# Now all the files/folders of the source here will be copied into an 'app' folder inside the container.This folder will be
# created in the container/image , if it doesn't already exist.
# Once we do that , we can set the second path to just '.' or './',which means the current working directory of the conatiner.
# Here we are explicitly mentioning /app instead of . to make things visually clear.

RUN npm install
# ****
# After copying all the files into the image, u wanna run a command in the image, here in this case,it is npm install
# There is a catch here though.All the commands get executed in the working directory of the docker container.
# By default,the working directory is the root folder in that container's file system.
# Since we are copying the code in the app folder,we need to tell docker that all commands should be executed in that
# folder.That will be done via an instruction before you copy everything.And that is WORKDIR set above

# Next we could do RUN node server.js , but that would be incorrect ,because this command would run on docker image 
# setup/built .The run command would try to start server in the image,which is incorrect.
# We only want to start a server, only when we start a container based on the image.
# ALso, if we start multiple containers from an image, we also start multiple servers.
# So we would use CMD, instead of RUN. CMD will be executed only when a container is started based on the image.
# CMD takes an array with commands split in array.
# If you dont specify a CMD,the CMD of base image will be executed .With no base image and no CMD ,you'd get an error.


# Since a docker container is isolated from our local env.As a result ,it also has its own internal network.
# Our server.js code says that it listens on port 80.
# But the container does not expose that port to our local machine.So we wont be able to listen on that port.
# Therefore in the docker file,after setting up everything and before specifying the CMD
# (which should be the last command in your Dockerfile)
# We use the EXPOSE instruction to let docker know that when a container is started, the port 80 should be exposed to our
# local system that runs our container


EXPOSE 80

CMD ["node","server.js"]

# Docker extension of vscode helps in writing the docker file
## Docker file contains a set of instructions to build our own image
