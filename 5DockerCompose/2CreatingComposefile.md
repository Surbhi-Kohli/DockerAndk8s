## Creating a Docker compose file https://docs.docker.com/compose/compose-file/
In your project folder, containing both react and node code, create a docker-compose.yml or docker-compose.yaml file.
Yaml is just a specific text format where you use indentation to express dependencies between configuration options.
In this file you have to describe your multi container project setup.

1.You start of by defining a version of docker compose specification that we want to use.
The ``version`` we define has an impact on the features that we can use in the compose file.Thats because ,the docker compose specification as well as the syntax that we use in docker compose file is under active development and may change over time.With this version, u kind of lock in features and syntax of that version.  

https://docs.docker.com/compose/compose-file/compose-versioning/  

2.Second is the ``services`` key.This takes nested values.Here you will mention services/containers to be build.Within each service u have configs for each .Eg you specify ``image``, ``volumes``.We can have nested values within ``volumes`` as we can have multiple volumes.You can also add ``environment`` option.You have 2 syntaxes for specifying environment vars.
 ``MONGO_INITDB_ROOT_USERNAME:max``
 `` - MONGO_INITDB_ROOT_USERNAME=max``
But you can also specify environment variable file.You create an env folder within the project and then create .env file for a service,eg mongo.env.There you can specify the environment variables.
then in ur file u can add env_file and specify list of files that should be used for the container.Here we will use - .If u have key value pair,
you dont use -.But if u have single value, u use -.

You can also add a network, with ``networks`` key and specify all networks that this container should belong to.But u dont necessarily do that,because when u use docker compose,docker will automatically create a new network for all the services specified in the compose file and all the services will be added to that network out of the box.   

<img width="523" alt="Screenshot 2023-07-22 at 3 54 10 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/20b51e31-50a4-4f75-8e41-e5ac87290782">  

3.For named volumes, you should add volumes key, at the same level as services.Anonymous volumes and bind mounts not need to be specified.  

<img width="1014" alt="Screenshot 2023-07-22 at 4 16 55 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/f9bd2ab8-7608-458c-93d3-a66e70674e43">


Also in compose file, you dont need to specify removal of container on shutdown , ``docker compose down`` would do that on its own. 

## Docker Compose up and down
``docker-compose up`` This starts all services defined in this compose file.It will automatically pull, build all required images and start containers.  It is in attached mode.
<img width="878" alt="Screenshot 2023-07-22 at 4 36 39 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/f47872ca-36fa-47ca-8ca9-8f5a5ae6b999">

To start container in detached mode, you can run ``docker-compose up -d``  

To stop containers, use ``docker-compose down``.This deletes all containers,also the default network that got created and shuts everything down.

  <img width="825" alt="Screenshot 2023-07-22 at 4 46 09 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/76c16434-d075-4ab4-a4d2-8ff3ad4f2062">

But it does not delete volumes.For that u have to run ``docker-compose down -v``  

<img width="829" alt="Screenshot 2023-07-22 at 4 46 55 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/fd274330-0ada-45bc-9a53-c10085ee21f0">  
