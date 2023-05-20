## Images and Containers ,what and why

Image is a sharable package with all setup instructions and runable code,while the container is a concrete running instance of such an image.
We run containers that are based on images.Images are immutable.


## Using Pre-Built image

Create account on docker.Install docker desktop and sign in.This will connect ur account to docker hub.
To get node image from remote(docker hub), run
         
         docker run node
         
This command will use the node image from docker hub and utilise it to create a container from this image.Containers are running instances of an image.Images are used to hold all the logic and code a container needs
Once we do that, we will be able to use the node's interactive shell.
    

          Unable to find image 'node:latest' locally
          latest: Pulling from library/node
          918547b94326: Pull complete 
          5d79063a01c5: Pull complete 
          4eedd9c5abf7: Pull complete 
          9cdadd40055f: Pull complete 
          b58a51cba8a5: Pull complete 
          e847ad7c3ab9: Pull complete 
          fbebe301b1ba: Pull complete 
          b3b8d2364ee3: Pull complete 
          Digest: sha256:942fa0013e9adfbde06ad07433bdb0a67cc2ac0d5a3db38f12a9c8f710b41f1c
          Status: Downloaded newer image for node:latest
          
          
       Once the download , it will run it as a container .Did our above container run? Yes, it did,but node is just
       a software.And we can execute node to get an interactive shell to insert command.But sonce a container is isolated from the surrounding env,and just because there might be some interactive shell running inside of a container,it doesn't mean that this shell is exposed to us by the conatiner.
       Nonetheless,the container was created and you can check that by running the following.
       
           docker ps -a
       ps=processes.The above command shows (-a) all processes(containers) that docker created.
       
       If we add -it flag, this would mean that we want to expose an "interactive" session from inside the container 
       to our hosting machine. 
          docker run -it node
This would expose the node repl and we can use the node apis there.

Important thing to note here is that the node is actually running inside the container,but is being exposed to the host machine by the -it flag,so that we can interact with the container and with the node running inside the container.
Node is not running on the host machine.
