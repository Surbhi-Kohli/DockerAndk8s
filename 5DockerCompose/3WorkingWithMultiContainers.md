
<img width="931" alt="Screenshot 2023-07-23 at 2 09 05 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/9b826fc0-fe60-4624-8a10-09069c78cf8f">  

For the ``build`` config, there are 2 methods.The longer elaborate method envolves specifying context,args,etc
Context should be set to a folder which includes everything that the dockerfile might be reffering to.If ur Dockerfile is in some nested folder  and needs access to files outside of the folder that contains dockerfile, then ur context should be set to a higher level folder.

<img width="621" alt="Screenshot 2023-07-22 at 10 33 20 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/5c4407f0-e271-4d0f-96cf-b9ec9aff98c7">  

When we list containers, we see that the name defined for the containers is :6compose-01-starting-setup-mongodb-1 ,6compose-01-starting-setup-backend-1.Nonetheless, the names u specify under services in docker-compose file will be memorized by docker-compose.And u can use these names inside the code to establish network connections.Thats why in app.js of node app, where we connect to mongodb as a name, it works  

<img width="740" alt="Screenshot 2023-07-22 at 10 38 47 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/30deb3a0-26fa-4280-8e90-7654435ee319">


For react's service, we also need our container to run in interative mode
stdin_opn + tty is for interactive mode even if u start the service in detached mode.It internally still knows that is able to receive input and will start up correctly.
In case u run docker-compose up and the image is already built, then it will not be re-built again and use the existing image.It only rebuilds if you change anything in code and docker-compose realizes that rebuilding is required. 

## Building images and understanding container names:
<img width="750" alt="Screenshot 2023-07-23 at 2 54 39 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/22b96da9-7f80-42e9-aa3d-f6313887df6f">
With ``docker-compose up --build`` , images would be rebuild everytime a service is started.
In case u want to build only the custom images defined via Dockerfile, You can do that via ``docker-compose build``.This will not start the container but just build all custom images mentioned in docker-compose file.

If u do ``docker ps``,you see that the names assigned to containers are not what u mentioned in services.
<img width="830" alt="Screenshot 2023-07-23 at 3 00 02 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/1e3e4332-1c44-4ab9-b6d0-9dadf8f09e20">

But if u want to assign ur own container name, u can add that option
<img width="766" alt="Screenshot 2023-07-23 at 3 06 06 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/e0214930-43f2-4003-8429-48af97a66ee5">

