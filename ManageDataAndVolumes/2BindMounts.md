## Bind Mounts

They are managed by the **developer** instead of docker.We do know where the bind mounts related data is stored on our local machine unlike in volumes where we dont.
We as a developer set the path to which the container internal path should be mapped on our host machine.
## Problem that Bind mounts solve:
Whenever we change anything in our source code in the app,those changes are not reflected in the running container unless we rebuild an image and run new container.
But during development phase, we make lot of changes in our code and want to run those on container.Rebuilding images and creating new containers each time would be cumbursome.Thats where **Bind Mounts** can help.We can put our source code into a **Bind Mount**.We could then make sure that the container is aware of that and the source code is actually read from the bind mount and not from the src code copy that we put into the image.Therefore the container would always have access to the latest code.**Bind Mounts** are perfect for persistent and editable data(While volumes can't be edited, since we dont know their location of storage). 

Since the persistent data is of importance to container and not to image, we dont have to make changes in dockerfile, rather we have to give additional config on container run.
 
 <img width="904" alt="Screenshot 2023-05-21 at 5 47 38 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/373b40da-b506-454d-a20f-1a03d2d4717b">. 
 
For the Bind mount, we specify the absolute path of the folder of the folder on host machine that has all the code, that should be part of mapping.and then put colon, specify the docker folder path.
If you don't always want to copy and use the full path, you can use these shortcuts:
macOS / Linux: -v $(pwd):/app
You can put this X:Y in quotes like follows, in case the absolute path has special characters like spaces.
  
          -v "/Users/s0k06tn/Downloads/DockerCollection/data-volumes-01-starting-setup:/app"

It is important to ensure that docker has access to the local machine folders that you are sharing as bind mount.You can confirm that in Docker desktop->preferences->Resources->FileSharing

Running the above command alone on data-volumes node project , when we run the container, it stops immediately.The reason is, we create a bind mount in container,which makes the container refer to  files from local system(it creates a two way mapping where even the container copies those files),which doesn't have node_modules, which are necessary for running the container.It does not refer to app folder in the image.
The container has a writable filesystem.  So in essence, the bind mount will overwrite(mapped overwrite) the file path in the container with our source files (from the host machine).


## Understanding Container and volume/bind mount interaction:
If we have a container , and a volume and bind mount,We can mount(create mapping) both into the container with the -v flag.
In case we have some files inside the container, then those will also get added in volume on the local machine.Also vice versa: If volume has a file that the container does not have, those files will be taken by container.Similarly for bind mount.
When we have same files both within volume/bind mount and the container,Docker doesn't overwrite the local machine files.Instead, the bind mount, on local machine overwrites the contents of docker container.
<img width="984" alt="Screenshot 2023-05-22 at 12 31 15 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/37a57506-e51f-475d-88e8-7edc148b7281">

Because of this, the above problem of container crashing occurs, where we get rid of the node_modules.To solve this problem, we need to tell docker that there are certain parts in its image's file system that it should be refering to instead of checking those from the bind mount.
We do this by adding an anonymous volume.
<img width="703" alt="Screenshot 2023-05-22 at 12 40 05 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/ea55ced3-adef-4037-bbc6-63bed6adc929">
This equivalent to adding a VOLUME instruction in dockerfile as follows.You can do either.  

<img width="758" alt="Screenshot 2023-05-22 at 12 43 33 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/1171b9c1-8596-40e6-8e8a-27ea7451fc83">

Passing the node_modules volume works because docker evaluates all volumes and Bind mounts.If there are clashes, the longer and specific internal path wins.
Here we have a /app bind mount and also /app/node_modules volume.The priority is given to /app/node_modules
This new volume /app/node_module ensures that the node_modules folder is not overwritten by bind mount.  
<img width="973" alt="Screenshot 2023-05-22 at 2 59 30 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/6f9890eb-5804-4efd-9288-a698bd2ca748">


<img width="967" alt="Screenshot 2023-05-22 at 2 59 56 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/1831279c-5c8a-4469-b08c-2ba9b384fe2e">

**Anonymous Volumes** cant be used to share  data across containers.You also cant save data across container destruction and recreation.But they are usefule for locking
in a certain data which might get overwritten by another module.The anonymous volume can help in such a case.Also since they create a folder on the host machine(which gets removed when a container is removed),so docker doesnt have to store data inside the container read-write layer, but it can outsource certain data to your host machine file system.This can help with performance and efficiency.

**named Volumes** cant be created with the Dockerfile,but instead we should use -v instruction when running the container.They survive container shutdown and removal.
These can be used to share data across multiple containers.
**Bind Mounts**:Here we know where hte data is stored on the host machine, they survive container shutdown and removal.If you wanna clear data of bind mount, u have to delete it on the host machine.
  
 Question 1:What's a "Volume" (when working with Docker)?    
 Ans:A file/folder inside the docker container that is connected to some folder outside the container.  
 Question2 : Can u know where the host folder(which is mapped to the container- internal path) is for a volume?  
 Ans: No. 
 Question 3: What is a bind mount?  
 Ans:A path on your host machine,which you know and specified, that is mapped to some container-internal path.  
 Question 4:What's a typical use-case for bind mounts?  
 Ans:You want to provide live data to the container(no rebuilding of image needed). 
 Question 5:Are anonymous containers useless?  
 Ans:No, you can use them to prioritize container-internal paths higher than external paths.
 
 ## Read only Bind mounts:
 If we want to restrict the container(and the app running inside container) from changing folders on our host machine(which are mapped via bind mount), we can specify this 
 by turning the bind mount into a "read-only" volume.
 By default, volumes/bind mounts are read-write which means the container is able to read data from there and write to them(volumes/ bind mount data on host machine).You can restrict by passing "ro" flag.
 <img width="812" alt="Screenshot 2023-05-30 at 9 26 36 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/65602bf4-e771-4b07-8026-36810c1bd709">

But an important thing to notice here is that this would make our entire bind mount folder (feedback and temp within the app) unwritable, while we actually want to write to those folders.Hence we must make sure that writing is possible to those folders.
Here we specify a more specific sub-volume then that sub-volume overwrites the main volume.
for app/feedback, we are good as we specify a volume(/app/feedback is more specific path than that specified in bind mount).
This makes the volume writable, as specific rules work.
Similar thing is done to temp folder,where we specify an anonymous volume.
**It is important to note that when we want to override the bind mount ro rule, we muct specify the anonymous volumes like the one for temp, in the command Docker run itself and not in dockerfile.**
 

