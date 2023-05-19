## Sharing Images
We share images and not containers.We can share a dockerfile , based on which an image can be build and container can be created.That can be one way.
Better way would be to share the image itself.
<img width="958" alt="Screenshot 2023-05-19 at 2 42 29 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/ec9bff13-e996-432f-8fed-61ed17e234ae">

## Pushing images to DockerHub
We can push the images to docker hub or a private registry.DockerHub is the official docker image registry.
<img width="1038" alt="Screenshot 2023-05-19 at 2 44 10 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/b746bad9-cb34-4284-bf14-81277651407f">
Pushing/pulling to private registry would require url details of the private registry.

For pushing an image, you need to have an image on your local with same name as the one u mentioned while creating repository on dockerhub.
Also u cannot push to a repository from local unless ur local logins in via the remote creds.The following command can be used to login or logout
 
             docker login/logout
             
 You will be prompted to enter docker id and password.
 Docker pushes in a very smart way.It does not push the entire image,which is pretty big.Instead, it sees that we are relying on node image and that already is on docker hub,so it establishes a connection to that node image and only pushes the extra stuff it needs and not the entire node image.
 
 ## Pulling and using shared images
 Pulling does not require you to be logged in if the repository is public.For pulling ur own private repo, u need to login??
    
             docker pull <image name>
     Docker pul always fetches the latest image from the registry        
 ## Important not about docker images:   
 If you try running a docker image that is available on your local system but present on docker hub, latest image will be pull automatically from the docker hub and will be run.
 But if you have a latest remote image, and also have a local image(which is not latest), docker run will not automatically pull the latest image .
 
 QnA
 1.What's the result of these commands?

         docker build -t myimage .
         docker run --name mycontainer myimage
         docker stop mycontainer

A.An image is created,a container is started and then stopped.Both ,images and container,have a name assigned by developer.
2.Assume that these commands were executed:

    docker build -t myimage:latest .
    docker run --name mycontainer --rm myimage
    docker stop mycontainer
Which of the below commands will fail?
a.docker ps -a
b.docker rmi myimage:latest
c.docker rm mycontainer
ans-c
This command fails. There will be no such container because it's automatically removed once stopped.
3.What's the idea behind image tags?
A.An image can have a name and then multiple "versions" of that image attached on the same name.
