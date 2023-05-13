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
        
 Interactive mode is different from attached mode.If we are in attached mode, we will be able to see the output in terminal ,given by the running container.
        But we wont be able to give any inputs to the container.That's because **attached mode** is **listen only** mode.
        If we want to do that then we need to be in interactive mode.
        
