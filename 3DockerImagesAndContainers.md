## Images and Containers ,what and why

Image is a sharable package with all setup instructions and runable code,while the container is a concrete running instance of such an image.
We run containers that are based on images.Images are immutable.
<img width="1311" alt="Screenshot 2023-05-04 at 8 29 13 PM" src="https://user-images.githubusercontent.com/32058209/236247357-f88b7448-b687-4489-bbdf-f00e37706b13.png">
<img width="1265" alt="Screenshot 2023-05-04 at 8 29 41 PM" src="https://user-images.githubusercontent.com/32058209/236247510-39b69be9-d83b-478a-a3d9-de68daebb8a8.png">

## Using Pre-Built image

Create account on docker.Install docker desktop and sign in.This will connect ur account to docker hub.
To get node image from remote(docker hub), run
    ``` docker run node
    This command will use the node image from docker hub and utilise it to create a container from this image.
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
          
          
       Once the download , it will run it as a container .
       
       ``` docker ps -a
       ps=processes.The above command shows all processes(containers) that docker created.
       
       
       docker run -it node
