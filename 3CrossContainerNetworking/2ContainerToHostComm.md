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
