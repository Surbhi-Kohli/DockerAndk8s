## Docker Compose:Automating multi container setup
Docker Compose is a tool that allows you to replace one or more ``docker build`` and ``docker run`` commands with just one Configuration file and a set of orchestration commands to start all the services/containers at once or build images at once, or stop all running containers at once.
This configuration file can be shared with anyone ,then it is just one command to be run.That command will leverage the configuration file to bring up or bring down your entire multicontainer application.
You may also use Docker compose in Single container application.But the docker compose shines the most in case of multi container app coz there u can save extra commands
<img width="966" alt="Screenshot 2023-07-22 at 1 32 44 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/552d270a-6afe-4b33-b80b-4b020f319534">  

<img width="562" alt="Screenshot 2023-07-22 at 1 34 07 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/21396f87-b9d1-4735-87a9-a60c1bf4dc66">
Docker compose just makes working with images and containers easier.It does not replace them.Docker compose is great for managing containers on the same host.
You start off by writing a docker compose file.Insteading of executing multiple commands in termical, you mention configs in compose file ,so that u can save time later.
The most importatnt thing to be defined in the compose file is the services(Containers).Then u can specify configs for that service.Eg u can specify the port where it should be published, which env variable the conatiner may need, volumes ,networks and pretty much anything that u can do in a termical with docker command otherwise.Because the basic idea is to replace running so many commands in terminal.   

<img width="721" alt="Screenshot 2023-07-22 at 1 48 09 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/6c5f97b7-3679-4256-9d10-0387422026bc">

## Creating a Docker compose file https://docs.docker.com/compose/compose-file/
In your project folder, containing both react and node code, create a docker-compose.yml or docker-compose.yaml file.
Yaml is just a specific text format where you use indentation to express dependencies between configuration options.In this file you have to describe your multi container project setup.You start of by defining a version of docker compose specification that we want to use.
The version we define has an impact on the features that we can use in the compose file.

