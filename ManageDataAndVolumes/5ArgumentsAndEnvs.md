Docker supports build time arguments and runtime env variables.  

<img width="971" alt="Screenshot 2023-06-03 at 3 08 11 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/4c6d4c2a-f8f7-4ce5-b9cf-670b2e76f426">


**ARGS** allow you to set flexible bits of data(variables) in your docker file which you can use to plug different values into certain Dockerfile instructions based on arguments which are provided with a --build-arg option when u run docker build.  
**ENVS** are available inside the Dockerfile like arg but also available in your entire application code.You can set them with the env option inside dockerfile,telling docker that u are expecting this env variable to be existent and then provide concrete values with --env on docker run.

ARGS and ENVs allow you to create more flexible images and containers because you dont have to hard code everything into the containers or images.Instead you can set those dynamically when you build an image or even only when u run a container.

           
           //some node js code of server.js file
         app.listen(process.env.PORT)
        //node embraces the concept of env variables and u access those on the globally available "process" object.
        //on that u can access env key, on which u can access env variables which have been set for the env.
        //You can set those globally available env variables via docker.Most languages and tools have some some kind of
        //support for such env variables.
      
        
    #    We can set/announce this env variable inside of a dockerfile. = method 1
        
 <img width="874" alt="Screenshot 2023-06-03 at 1 36 33 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/5ad8db1a-2d4f-4394-9fc2-0c6a64908ddb"> 
 
       $<Variable> tells docker that it needs to search for an env variable with name "Variable" and plug its value.

The advantage of env variable is that we can configure the value of the variable when we run the container.We are not limited to this hardcoded value.We have a default value in the dockerfile, but we dont have to stick to that.  

<img width="899" alt="Screenshot 2023-06-03 at 2 49 09 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/26477a70-753f-4ffb-8ba7-24bb6be36f64">. 

You can use -e, instead of --env.Also u can add multiple key value pairs like -e PORT=8000 -e <ENVKEY2>=<ENVVal2> -e <ENVKEY3>=<ENVVal3>
This env variable port value of 8000 will be exposed by the container and thats what will be used by the server.js.
Advantage: We dont need to rebuild the image just to change the port exposed by docker.We can just mention the port via env variable using run command.
           
  #  Another way to mention env variable values = method 2
  You can create a file named .env in your application,where u can setup your env variables key value pairs. Then on docker run, you can mention to use the values of .env file
           <img width="847" alt="Screenshot 2023-06-03 at 3 23 49 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/a466450b-1b02-441c-b8d2-715f5f923542">

           Advantage: You can just switch values in your .env file and run docker run .
           
 ## Environment Variables & Security
One important note about environment variables and security: Depending on which kind of data you're storing in your environment variables, you might not want to include the secure data directly in your Dockerfile.

Instead, go for a separate environment variables file which is then only used at runtime (i.e. when you run your container with docker run).

Otherwise, the values are "baked into the image" and everyone can read these values via docker history <image>.

For some values, this might not matter but for credentials, private keys etc. you definitely want to avoid that!

If you use a separate file, the values are not part of the image since you point at that file when you run docker run. But make sure you don't commit that separate file as part of your source control repository, if you're using source control.


           
