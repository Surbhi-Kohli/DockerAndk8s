## Bind Mounts

They are managed by the **developer** instead of docker.We do know where the bind mounts related data is stored on our local machin unlike in volumes where we dont.
We as a developer set the path to which the container internal path should be mapped on our host machine.
## Problem that Bind mounts solve:
Whenever we change anything in our source code in the app,those changes are not reflected in the running container unless we rebuild an image and run new container.
But during development phase, we make lot of changes in our code and want to run those on container.Rebuilding images and creating new containers each time would be cumbursome.Thats where **Bind Mounts** can help.We can put our source code into a **Bind Mount**.We could then make sure that the container is aware of that and the source code is actually read from the bind mount and not from the src code copy that we put into the image.Therefore the container would always have access to the latest code.**Bind Mounts** are perfect for persistent and editable data(While volumes can't be edited, since we dont know their location of storage). 

Since the persistent data is of importance to container and not to image, we dont have to make changes in dockerfile, rather we have to give additional config on container run.
 
 <img width="904" alt="Screenshot 2023-05-21 at 5 47 38 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/373b40da-b506-454d-a20f-1a03d2d4717b">
For the Bind mount, we specify the absolute path of the folder of the folder on host machine that has all the code, that should be part of mapping.and then put colon, specify the docker folder path.  
You can put this X:Y in quotes like follows, in case the absolute path has special characters like spaces.
  
          -v "/Users/s0k06tn/Downloads/DockerCollection/data-volumes-01-starting-setup:/app"
