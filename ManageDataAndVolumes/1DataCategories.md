We need to understand different kinds of data , to know the problems we might be facing/solving in containerization.

1.Application(Source code and env): This data is added to image during the build phase.This code in image can't be changed once image is built.It is READ Only.
2.Temporary Data: Data generated whilst the application is running.We are fine with lossing the data when the container shuts down.Its a read & write temporary data
   which is stored in containers.The docker stores a container layer(extra layer) over the image layers.This layer mirrors the image's file system on the container layer, without copying it.
   This layer able to read, write on the mirrored file system without changing it on the original (image)layer.Behind the scnenes ,it is managed in a very efficient way,where docker basically keeps track of the changes made by the container and derives the final file system,by taking the file system in the image and combining it with the changes stored in read-write layer.
   <img width="869" alt="Screenshot 2023-05-20 at 3 53 27 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/5a8c6ffc-4e4b-476a-8dcb-11f16a986f59">

3.Permanent App Data: The data should survive even when the container is stopped or even removed(deleted).We store this in conatiners,but with the help pf volumes.
<img width="968" alt="Screenshot 2023-05-20 at 3 19 28 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/9a0e7931-6492-4d97-9a34-fa822a66144d">



## Volumes:
Docker has a built in feature called Volumes.They help in data persistence.They are folders on the host machine which have mapping with the folders on container.
Any changes on volume folders in containers gets reflected on your local folders and vice versa
<img width="875" alt="Screenshot 2023-05-20 at 9 23 10 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/486ea81b-5337-437f-8cf4-eb6108de4cbf">

## How can we add Volume to our container??
