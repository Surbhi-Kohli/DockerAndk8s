## What if u want to add something to a container or extract something from it whilst it is already running
This feature is mostly for development/testig purpose.You wouldn't really copy files into a production container. 
But it can be helpful for copying some dummy data into a container while you are in your development or testing and dont want to
recreate a new image to run a new container.

                   docker cp <src_path> <ContainerName>:<destination_path inside the container> 
                   //Allows u to copy files or folders into a running container or out of a running container
                   
                   //eg: 
                    docker cp dummy/. clever_taussig:/test
Consider that you have a running container and you add some files in your app ,whose container u have created.Now u can directly copy the 
files into your running container.You can do that via the above command.
What if you want to extract some files  from your container to ur local app:
                  docker cp <ContainerName>:<path inside container of the file u want in the local> <Destination path in local filesystem>
                  docker cp clever_taussig:/test dummy 
  
  
  This is actually a bad practice and is error prone.Also you cannot copy/update a file that is currently running in the container, eg server.js cant be copied /updated
  as it is running in the container.
  
  But copying files out of a container can be useful.In case your container generates log files.
  You can actually cp those to ur local file system so that you can read them there.
 ##
## Naming and tagging Containers and Images:
  
  **Naming Containers** 
                     docker run -p 3000:80 --name <TheName u wanna Give to ur container> <Imageid from which the container is to be created>
                      docker run -p 3000:80 --name surbhiNodeApp 22d13dc7bf8e
   **Naming Images**

  For the images taken from docker hub, u might notice that the image has a **tag** and a **repository**, but for the image build by us via the Dockerfile,
  both these values are "none".
    When you generate an image via docker build, the generated image just has an id.You can assign a name to images.But in case of images, name is called a tag.
  An image tag consists of 2 parts.
  **name**(also called repository) of the image:**tag**.Combining these 2 , we should always have a unique identifier for the image.
  The concept of having these 2 parts exists for a simple reason .
  With the **name** you can setup a general name of the image.Eg this name might be common for a group
  of multiple, specialized images, eg "node"
  The **tag** can define one specialized image within the group of images, eg 14, 
  This would make the image name as  node:14
  For node image eg, u canmention ur base image as node:14 and that would pull node v14 from the dockerhub.
  The following is a screenshot of docker hub.Here we see all the tags that are supported by the node image,that u can set after ':' when setting node
  as a base image in your dockerfile.This would tell dockerhub that u need a specific version of the node image.With this we can get a 
  particular version with a particular config, eg a slim version like follows :"20-bullseye-slim", "20-slim", "20.2-bullseye-slim", "20.2-slim" , which 
  is a bit smaller as uses a lightweight version of OS and so on.
  
  <img width="847" alt="Screenshot 2023-05-19 at 1 24 46 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/83d25dd4-4958-4611-a6f8-02fa0d265afd">

  ##
  We can do the same with our own images.If the image has no tag, name alon is the unique identifier.
                 //Command to give name, tag to images:  docker build -t <name>:<tag> <pathOfDockerFile>
                    docker build -t goalsApp:latest .  
  
  <img width="540" alt="Screenshot 2023-05-19 at 1 46 15 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/9d6b7328-f83c-4007-a969-b045ccc2b19f">

  Now you can run a container from the named image
                        docker run -p 3000:80 <image name:tag>
  
  Side note: If you want to remove all images, including the tagged images run.
                    docker images prune -a
