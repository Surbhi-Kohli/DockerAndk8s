<img width="916" alt="Screenshot 2023-05-11 at 8 33 41 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/97c25ec3-ab95-4ff1-9f5f-d3b08cfffe4b">

## Stopping and restarting containers

        docker --help
        //gives a list of main commands you can run with docker
        docker ps //lists all running containers
        docker ps -a //list of all containers (whether running or stopped)
        docker ps --help //you see all available docker ps config options
        docker run <imageid> //creates a new container based on an image
        //If nothing has changed in our code and our image is unchanged, then there is no need to create a brand new container.We can rather restart stopped containers
        
        docker ps -a //to find all containers including stopped ones,grab hold of the name of a stopped container
        docker start <name/id from previous command>
        //this starts the container in non blocking mode of terminal.You run the command,container starts in the background and
        //terminal is back.While 'run' will block ur terminal
        <img width="647" alt="Screenshot 2023-05-11 at 8 56 02 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/f4ced4e8-6752-4302-9f1b-2ff1c3b909d2">

## Understanding attached or detached containers
Terminal is stuck , when 'docker run' is used.The container is running in the foreground:
<img width="703" alt="Screenshot 2023-05-11 at 9 06 18 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/5b5fe38d-2cba-44b5-a09f-fc0b90316a62">

This is not a bug,this is just a different config.You can configure whether you want to be in attached mode or detached mode.
When we use 'docker start',container runs in detached mode by default, while when using 'docker run',container runs in attached mode.

## Which mode to use and why does it matter?
Attached means that the output of the running container matters to the terminal and the termin al is listening to it and  may need to show that.
eg, if the container has code that should log something in terminal,that will get logged in case of attached mode and not in detached mode.
Consider our container running the goal creation node app.If I add a goal in the app running from container, the terminal loggs the newly added goal
<img width="954" alt="Screenshot 2023-05-11 at 9 18 09 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/9a77f1d6-791f-4e57-81a0-8054e95f3672">

<img width="656" alt="Screenshot 2023-05-11 at 9 16 36 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/15fe710b-0b45-4555-8335-e3da77cc6171">


We can run a container in detached mode  by specifying -d flag
         docker run -p 8001:80 -d b9a91fa63e22 
         <img width="625" alt="Screenshot 2023-05-11 at 9 35 28 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/dc11a572-ee81-4367-bf4f-ea3e817f341e">
 You can attache yourself to a running detached container by running
        docker attach <Container name/id>
  
  If you want to see the logs while still being in detached mode you can use the following:
               docker logs <Container name>
  We will be able to see the past logs that were printed by the container
              docker logs --help //to see all configs possible for docker logs
              docker logs -f <Container name>. //you will get past logs ,but will keep listening to future logs as well
  
  
  If you want to 'start' a container in attached mode
               docker start -a <container name>
  
        
        
## Entering Interactive mode:
        
 **Interactive mode** is different from **attached mode**.If we are in attached mode, we will be able to see the output in terminal ,given by the running container.
        But we wont be able to give any inputs to the container.That's because **attached mode** is **listen only** mode.
        If we want to do that then we need to be in interactive mode.
        
  **Refer Python project for more details**
          #this is an app that wil be printing to terminal.So running container in background 
  #would not be good.We want to run the container in attached mode here.
  # But there is a catch here, when we run docker run <image>,we would be in attached mode but we would not be able to 
  # give user input.So we would need to run by explicitly passing --i or --interactive flag.
  # This would keep the STDIN open even if not attached.With this flag, we will be able to provides input.
  # We usually combine --i with --t OR --tty=allocates a pseudo-tty,ie creates a terminal 
  # both flags combined become -it
  #  docker run -it <image>
  #  docker run -d -it <image> wont work
  ##
  # Now we see the container is stopped and get its name via 'docker ps -a'
  # We can start the stopped container in attached mode by passing -a flag
  # 'docker start -a <container name>'
  # It will just take 1 input and after that behaves starngely.DOesn't take user input.
  # So we will stop this  'docker stop <container name>'
  # So we will start the container in interactive mode
  # 'docker start -a -i <container name>', we can also do 'docker start -i <container name>' 
        
 ## Deleting Images and Containers:
   **docker rm** cane be used to remove containers
        If you try removing a running container,you wont be able to do that
<img width="528" alt="Screenshot 2023-05-13 at 2 09 48 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/b2ec370b-a03f-427a-b764-00f88c629cdf">
So we first of all need to stop running containers and only then can we delete those
        <img width="818" alt="Screenshot 2023-05-13 at 2 15 24 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/95d4c020-f3d4-491e-9189-28db26a949c8">
You can remove multiple containers in a single go via:
           docker rm <ContainerName1> <ContainerName 2> <Container name3> <Container name4>
        
        Alternate way to remove all stopped containers:
             docker container prune
        
    ## Deleting Images:
            docker images 
        This command lists all docker images
        <img width="679" alt="Screenshot 2023-05-13 at 2 29 01 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/59d1d08e-6041-41a1-9461-33e266dbc46e">
You can remove an image via `docker rmi <imageid>`
        <img width="824" alt="Screenshot 2023-05-13 at 2 40 09 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/5819f630-f32f-483e-8801-461dc7dccf4c">
        
        But if you try removing an image that is being used by a container(even a stopped container), you will get an error message.You wont be able to delete that image.
        You would need to remove the container first.
        <img width="829" alt="Screenshot 2023-05-13 at 2 38 19 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/6bff6108-056a-4a70-9a9c-b8f0aae88b74">
        You can remove more that one image manually as follows
         docker rmi <imageid1> <imageid2> <imageid3> <imageid4>
        If u wanna remove all the images that are not being used in containers , u can do the following:
               docker image prune

        
