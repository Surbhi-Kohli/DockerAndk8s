 # Images are Read Only
 
 If you edit/update your source code,(in our case, the nodejs code),you can't expect that the image to be updated and the container created/run from that image to show the updated code.
   We will have to rebuild the image to copy our updated source code into a new image.Images are locked once u build them.
   An image is actually a closed template.The Dockerfile instructions are read to create an image and then the image is locked.
   
 # Understanding Image layers
 
 Consider the following Dockerfile
 <img width="423" alt="Screenshot 2023-05-10 at 9 25 54 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/01a6788c-c011-40cb-b348-0a5643458b6a">

 Images are layer based.When u rebuild an image, only the instructions that changes and all the instructions thereafter (in the dockerfile) are re-evaluated
 Without any change in code or dockerfile,if you rebuild the image:
 
<img width="738" alt="Screenshot 2023-05-10 at 8 58 08 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/00a537d5-6ea8-40cb-b75e-9a5c202bb2e3">
The build is very fast.Docker recognized that the result of execution of dockerfile's instructions will be the same as before:We have the same working directory, the code
is not changed,so it does not need to execute the instructions again.Docker will use the cached results of instructions.
This is because,when you build an image,docker caches every instruction's result,which can be used later .
This is called __layer based architecture__.Every instruction of Dockerfile represents a layer .Every image is based on multiple layers(instructions) of the dockerfile.
Image is read only.
<img width="1229" alt="Screenshot 2023-05-10 at 9 16 33 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/130d3a60-240a-4b69-99af-c20943f80924">

In case u update something in your code ie in the server.js file of the example code, docker detects that a file has changed, so it re-runs the COPY instruction also all the instructions there after.Docker is not able to tell whether re-running of npm install is required or not after the code change.It does not do a deep analysis of which file changed where, and if the change could impact 'npm install' instruction.

<img width="723" alt="Screenshot 2023-05-10 at 9 23 47 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/d81a645e-d132-4124-9ae1-b4e902c82a75">

Whenever one layer(instruction) changes, all the subsequent layers are re-executed on rebuild.

The layer architecture exists to speed up the creation of images, since docker only rebuilds/re-executes whatever needs to be .

But as of now in our Dockerfile, there is a scope for optimization.Whenever anything in our code(server.js) changes , docker runs npm install, when we as a developer know that it is unnecessary,unles we have changed something in package.json.

<img width="550" alt="Screenshot 2023-05-10 at 9 41 20 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/7e814749-3f42-4b21-adcf-6b57167dbfc5">
