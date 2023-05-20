You can build up on a pre-built node image to create your own image on top of it.

<img width="710" alt="Screenshot 2023-05-07 at 4 55 33 PM" src="https://user-images.githubusercontent.com/32058209/236674619-eb73b522-9c80-4660-9349-92579f72a8b8.png">

We will use a dummy nodejs project to build an image out of it.

Add a dockerfile to your node application
 all these commands are used for image setup.

## FROM node 
FROM: build image up on another base image that either exists on your system or is there on docker hub with the given name

## WORKDIR /app
 **
ALl subsequent commands will be executed within the /app 

## COPY . /app

 COPY path1 path2  The first path is the source path where the files(code) live ,and which should be added in 
 the image(excluding the Dockerfile).
 If you specify a '.' , it means the path is same as the path where Dockerfile is present.
 The second path is the path inside the image where those should be stored.
 Every image (also every container based on the image) has its own internal filesystem which is totalyy detached from 
 your file system on your system.It is hidden away inside of the docker container.
 It is recommended to not use root folder in docker container for this.Should use some sub folder.Here we are naming it
 as /app
 Now all the files/folders of the source here will be copied into an 'app' folder inside the container.This folder will be
 created in the container/image , if it doesn't already exist.
 Once we do that , we can set the second path to just '.' or './',which means the current working directory of the conatiner.
 Here we are explicitly mentioning /app instead of . to make things visually clear.

## RUN npm install
 ****
 After copying all the files into the image, u wanna run a command in the image, here in this case,it is npm install
 There is a catch here though.All the commands get executed in the working directory of the docker container.
 By default,the working directory is the root folder in that container's file system.
 Since we are copying the code in the app folder,we need to tell docker that all commands should be executed in that
 folder.That will be done via an instruction before you copy everything.And that is WORKDIR set above

 Next we could do RUN node server.js , but that would be incorrect ,because this command would run on docker image 
 setup/built .The run command would try to start server in the image,which is incorrect.
 We only want to start a server, only when we start a container based on the image.
 ALso, if we start multiple containers from an image, we also start multiple servers.
 So we would use CMD, instead of RUN. CMD will be executed only when a container is started based on the image.
 CMD takes an array with commands split in array.
 If you dont specify a CMD,the CMD of base image will be executed .With no base image and no CMD ,you'd get an error.


 Since a docker container is isolated from our local env.As a result ,it also has its own internal network.
 Our server.js code says that it listens on port 80.
 But the container does not expose that port to our local machine.So we wont be able to listen on that port.
 Therefore in the docker file,after setting up everything and before specifying the CMD
 (which should be the last command in your Dockerfile)
 We use the EXPOSE instruction to let docker know that when a container is started, the port 80 should be exposed to our
 local system that runs our container


## EXPOSE 80

## CMD ["node","server.js"]

 Docker extension of vscode helps in writing the docker file
 Docker file contains a set of instructions to build our own image

****************************************

## Running a container based on your own image

docker build <path to dockerFile>


        docker build .//create custom image based on the dockerfile

  <img width="817" alt="Screenshot 2023-05-07 at 5 09 40 PM" src="https://user-images.githubusercontent.com/32058209/236675248-d94b6d04-c22e-49ff-98f3-5edf8e2c6ebf.png">
Now to run the container:
        docker run b9a91fa63e227d41043a48a9549260ef011a58c3649fc3acafc34b1ce1542a61   (docker id)
  
  This will start a container that keeps running.Under the hood the server.js file runs which is an ongoing process that doesn't finish.
    But if you visit localhost, you won't see the website,even though we exposed the port as per the dockerfile.
        
        To shut the container,open a new terminal and run
                docker ps //gives only the running processes
                docker stop <container name received from previous command>
        
    # Why were we not able to listen on this custom container?
        Because an important step is missing here.The EXPOSE step in Dockerfile is just for documentation purpose.It doesn't do anything.This
        instruction is optional.
        Important thing here is when you execute docker run, u add special option (-p= publish)
 
                         docker run -p <localport>:<internal docker port> <containerId>
        The internal docker port has to be what your node application is listening on as mentioned in your app
 
        This allows us to tell docker, under which local port on our machine, the internal docker specific port should be accessible.
                           docker run -p 3000:80 b9a91fa63e227d41043a48a9549260ef011a58c3649fc3acafc34b1ce1542a61 
        EXPOSE & A Little Utility Functionality
In the last lecture, we started a container which also exposed a port (port 80).
 
<img width="535" alt="Screenshot 2023-05-20 at 2 33 25 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/a613ae13-a8ca-496d-8982-8894ff64d7b9">

I just want to clarify again, that EXPOSE 80 in the Dockerfile in the end is optional. It documents that a process in the container will expose this port. But you still need to then actually expose the port with -p when running docker run. So technically, -p is the only required part when it comes to listening on a port. Still, it is a best practice to also add EXPOSE in the Dockerfile to document this behavior.

As an additional quick side-note: For all docker commands where an ID can be used, you don't always have to copy / write out the full id.

You can also just use the first (few) character(s) - just enough to have a unique identifier.

So instead of

docker run abcdefg
you could also run

docker run abc
or, if there's no other image ID starting with "a", you could even run just:

docker run a
This applies to ALL Docker commands where IDs are needed.


        
  
  
