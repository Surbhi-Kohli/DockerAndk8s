We need to understand different kinds of data , to know the problems we might be facing/solving in containerization.

1.**Application(Source code and env)**: This data is added to image during the build phase.This code in image can't be changed once image is built.It is READ Only.  
2.**Temporary Data**: Data generated whilst the application is running.We are fine with lossing the data when the container shuts down.Its a read & write temporary data
   which is stored in containers.The docker stores a container layer(extra layer) over the image layers.This layer mirrors the image's file system on the container layer, without copying it.  
   This layer able to read, write on the mirrored file system without changing it on the original (image)layer.Behind the scnenes ,it is managed in a very efficient way,where docker basically keeps track of the changes made by the container and derives the final file system,by taking the file system in the image and combining it with the changes stored in read-write layer.
   <img width="869" alt="Screenshot 2023-05-20 at 3 53 27 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/5a8c6ffc-4e4b-476a-8dcb-11f16a986f59">
  
3.**Permanent App Data**: The data should survive even when the container is stopped or even removed(deleted).We store this in conatiners,but with the help pf volumes.
#
<img width="968" alt="Screenshot 2023-05-20 at 3 19 28 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/9a0e7931-6492-4d97-9a34-fa822a66144d">

## Types of external storage mechanisms for data

<img width="1058" alt="Screenshot 2023-05-21 at 2 21 58 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/04e593ac-1f39-43b4-b0b9-b700549c7fd7">

## Volumes:
Docker has a built in feature called Volumes.They help in data persistence.They are folders on the host machine which have mapping with the folders on container.
Any changes on volume folders in containers gets reflected on your local folders and vice versa.Volumes are of 2 types: anonymous and named.
For both the cases,docker sets up some path on your local machine for the volume.  

**Anonymous Volumes** : Only exist as long the container exists.When we remove our container, the anonymous volume would also be gone.The volume does not delete when we just stop the container.Anonymous volumes are closely attached to one specific container.  

**Named Volumes** :The named volumes servive even on container removal/deletion.If you start new container, after removal of older container,named volumes would be back.
They are great for data that should be persistent.But you can't edit that data directly as you would not know the path of the volume on your local machine.They are not attached to a container.
#
<img width="875" alt="Screenshot 2023-05-20 at 9 23 10 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/486ea81b-5337-437f-8cf4-eb6108de4cbf">

## How can we add Volume to our container??

1.Add VOLUME instruction in Dockerfile.   

<img width="716" alt="Screenshot 2023-05-21 at 2 19 13 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/616068a7-c0b8-4e17-beda-3a536df938d8">.   

This will create an anonymous Volume to the image that gets created .  
2.We create a named volume when we run a container and we pass the -v flag
             
                  docker run run -d -p 3000:80 --rm  --name feedback-app -v <VolumeName>:<Path on container that is to beCopiedOnVolume> feedback-node:volumes
                  eg  docker run -d -p 3000:80 --rm  --name feedback-app -v feedbackvolume:/app/feedback feedback-node:volumes
<img width="737" alt="Screenshot 2023-05-21 at 3 49 11 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/be3b9e29-0f76-4ee8-8491-630885c27faf">

Now when you would remove this feedback-app container, the volume would still be there and you can see it via:  
           
                 docker volume ls   
                 
When u create a new container again along with -v flag and same volume name, path, you would be able to see that the container does retain previous data on volume
that previous container had stored.
**Commmands**    
     
              docker volume ls //to list all volumes currently being managed by docker.  
             
   <img width="644" alt="Screenshot 2023-05-21 at 2 30 21 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/d505baf4-d081-4adf-b354-d202036ee2e6">. 
   
Volume name is an automatically generated name in case of anonymous volumes.
We saw, that anonymous volumes are removed automatically, when a container is removed.
This happens when you start / run a container with the --rm option.If you start a container without that option, the anonymous volume would NOT be removed, even if you remove the container (with docker rm ...).

Still, if you then re-create and re-run the container (i.e. you run docker run ... again), a new anonymous volume will be created. So even though the anonymous volume wasn't removed automatically, it'll also not be helpful because a different anonymous volume is attached the next time the container starts (i.e. you removed the old container and run a new one).

Now you just start piling up a bunch of unused anonymous volumes - you can clear them via 
   
                   docker volume rm VOL_NAME 
                   //or 
                   docker volume prune.


