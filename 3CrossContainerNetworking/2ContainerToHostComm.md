## Case 2:Container to host communication:
We want to make the dockerize app to communicate to the host system.For this you really only need to change your code a little bit.You don't need to start your container differently.
Instead, there is a special instruction,a special hint you can give to Docker in your code.
You need to replace localhost with a special domain,which is understood by Docker and that's `host.docker.internal`.It's understood by Docker.

And it's translated to the IP address off your host machine as seen from inside the Docker container.
And you can use this anywhere where you need a domain,where you need a URL.

Here, it's for a MongoDB type of request.But it could also be for an HTTP request,if you had some web server running on your machine and your code would need to talk to that.  
<img width="512" alt="Screenshot 2023-06-04 at 4 18 06 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/b5af490a-ce02-4ac1-8d7e-c73df81eeebb">

## Case 3: Container to Container communication:
1. Basic Solution
``docker container inspect <containerName>`` will give info about the running container.The important piece of info here would be the IP address
would be found under NetworkSettings key
<img width="664" alt="Screenshot 2023-07-23 at 4 08 44 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/15a60dd8-7368-492c-bfc2-95d9476131d6">

The IP address can be used to contact the mongodb container within the modejs container.  The nodejs container will now be able to connect to the mongodb container.
<img width="780" alt="Screenshot 2023-07-23 at 4 13 09 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/99b5e15b-45fe-48d2-a411-6eb769a2289e">
But this process is not very convenient.We had to lookup for ip address of our running mongodb container.Also, we will have to update our node container , ie build a new image, with new mongodb ip ,whenever the ip changes
2.Via Docker networks:
<img width="983" alt="Screenshot 2023-06-10 at 4 22 02 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/1c221339-5a2f-44e7-9dbd-dfe52c153a7f">
With Docker, you can create so-called container networks,also called just networks.So, what are networks then?Well, the idea is that you might have multiple containers and you want to allow communication between these containers.So, essentially the scenario we have with the node web API container and the MongoDB container.Now, with Docker, you can put all these containers into one and the same network by adding the --network option on the Docker run command.This then creates a network in which all containers and Docker is then automatically doing this IP look up and resolving stuff,which we did manually in previous method.
And that's a really useful feature for having multiple, isolated containers with their own duties and tasks,which still are able to talk to each other.
