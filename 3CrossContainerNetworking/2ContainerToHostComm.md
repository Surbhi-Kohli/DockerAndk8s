## Case 2:Container to host communication:
We want to make the dockerize app to communicate to the host system.For example, u want the node app running on the container to communicate with the mongodb running on the local.For this you really only need to change your code a little bit.You don't need to start your container differently.
Instead, there is a special instruction,a special hint you can give to Docker in your code.
You need to replace localhost with a special domain,which is understood by Docker and that's `host.docker.internal`.It's understood by Docker.

And it's translated to the IP address off your host machine as seen from inside the Docker container.
And you can use this anywhere where you need a domain,where you need a URL.

Here, it's for a MongoDB type of request.But it could also be for an HTTP request,if you had some web server running on your machine and your container would need to talk to that.  
<img width="512" alt="Screenshot 2023-06-04 at 4 18 06 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/b5af490a-ce02-4ac1-8d7e-c73df81eeebb">

## Case 3: Container to Container communication:
1. Basic Solution
``docker container inspect <containerName>`` will give info about the running container.The important piece of info here would be the IP address
would be found under NetworkSettings key
<img width="664" alt="Screenshot 2023-07-23 at 4 08 44 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/15a60dd8-7368-492c-bfc2-95d9476131d6">

The IP address can be used to contact the mongodb container within the modejs container.  The nodejs container will now be able to connect to the mongodb container.
<img width="780" alt="Screenshot 2023-07-23 at 4 13 09 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/99b5e15b-45fe-48d2-a411-6eb769a2289e">  

But this process is not very convenient.We had to lookup for ip address of our running mongodb container.Also, we will have to update our node container , ie build a new image, with new mongodb ip ,whenever the ip changes.  

2.Via Docker networks:
<img width="983" alt="Screenshot 2023-06-10 at 4 22 02 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/1c221339-5a2f-44e7-9dbd-dfe52c153a7f">
With Docker, you can create so-called container networks,also called just networks.So, what are networks then?Well, the idea is that you might have multiple containers and you want to allow communication between these containers.So, essentially the scenario we have with the node web API container and the MongoDB container.Now, with Docker, you can put all these containers into one and the same network by adding the --network option on the Docker run command.This then creates a network in which all containers are able to communicate with each other and Docker is then automatically doing this IP look up and resolving stuff,which we did manually in previous method.  

So for this, first of all, you will have to create a custom docker network via the following command:  
``docker network create <networkName>``  

A docker internal network gets created which u can then use on docker containers.With  ``docker network ls`` ,you can inspect all existing networks.Then once the network is created, u can run ur container with the --network flag
Now u can add containers within this network while running the container.  Here we have added mongodb to the network:

<img width="555" alt="Screenshot 2023-07-23 at 4 45 15 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/f59e2483-4c3e-4304-abbf-ae41d2227345">  


But the question here is , what code change is to be done in nodejs app running in a container within favourites-net network  to communicate with mongodb container.You just need to mention the container's name to which the current container(node container) should connect, provided that the mongodb container is within the same network.

  
<img width="644" alt="Screenshot 2023-07-23 at 5 21 40 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/7bfc80fc-a15e-4798-bbaf-c3747dededca">

<img width="600" alt="Screenshot 2023-07-23 at 5 06 23 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/8ec89fd2-7555-49cb-a9cc-79bbbaddcd21">


And that's a really useful feature for having multiple, isolated containers with their own duties and tasks,which still are able to talk to each other.  

**Another important thing to notice here**:when we launch a container, in our case consider the mongodb container,to which our node container connects to,we dont need to publish any ports.When running the to be connected container, we dont publish ports.The reason is that -p is only required if i plan on connecting to something in that container from our local machine or from outside our container network.
Here the only thing that connects to mongodb container is the nodejs favourites container which is within the network.
So container to container communication deosn require port publishing because internally, the container network, all the containers can freely communicate with each other without the need to expose ports

## How docker resolves IP addresses  

<img width="1110" alt="Screenshot 2023-07-23 at 10 35 39 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/fffcac58-586a-4d47-846c-9144e5106182">  
Docker does not replace the code ie see the name of container and replace it with the IP address.Instead ,docker owns the environment in which ur
application runs.If ur application sends an HTTP request or a mongodb request,or any request that leaves the container, the docker is aware of that and its at that point of time, docker is able to resolve the address or the container name or the host.deocker.internal and replace it with actual IP address,since it is aware of the surrounding containers and the host machine.  

So it's only when a request leaves the container, the IP address is found.If a request doesn't leave a container or a request is generated somewhere else, eg in the browser,if ur users are visiting ur web app and js code is running in the browser and a request is sent from there, then docker is not doing anything because it is not replacing the source code.

## Docker Network Drivers
Docker Networks actually support different kinds of "Drivers" which influence the behavior of the Network.

The default driver is the "bridge" driver - it provides the behavior shown in this module (i.e. Containers can find each other by name if they are in the same Network).

The driver can be set when a Network is created, simply by adding the --driver option.

``docker network create --driver bridge my-net``

Of course, if you want to use the "bridge" driver, you can simply omit the entire option since "bridge" is the default anyways.

Docker also supports these alternative drivers - though you will use the "bridge" driver in most cases:

host: For standalone containers, isolation between container and host system is removed (i.e. they share localhost as a network)

overlay: Multiple Docker daemons (i.e. Docker running on different machines) are able to connect with each other. Only works in "Swarm" mode which is a dated / almost deprecated way of connecting multiple containers

macvlan: You can set a custom MAC address to a container - this address can then be used for communication with that container

none: All networking is disabled.

Third-party plugins: You can install third-party plugins which then may add all kinds of behaviors and functionalities

As mentioned, the "bridge" driver makes most sense in the vast majority of scenarios.
