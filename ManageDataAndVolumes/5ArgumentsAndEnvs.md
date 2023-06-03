Docker supports build time arguments and runtime env variables.

**ARGS** allow you to set flexible bits of data(variables) in your docker file which you can use to plug different values into certain Dockerfile instructions based on arguments which are provided with a --build-arg option when u run docker build.  
**ENVS** are available inside the Dockerfile like arg but also available in your entire application code.You can set them with the env option inside dockerfile,telling docker that u are expecting this env variable to be existent and then provide concrete values with --env on docker run.

ARGS and ENVs allow you to create more flexible images and containers because you dont have to hard code everything into the containers or images.Instead you can set those dynamically when you build an image or even only when u run a container.

           
           //some node js code of server.js file
         app.listen(process.env.PORT)
        //node embraces the concept of env variables and u access those on the globally available "process" object.
        //on that u can access env key, on which u can access env variables which have been set for the env.
        //You can set those globally available env variables via docker.Most languages and tools have some some kind of support 
        // for such env variables.
        
        We can set/announce this env variable inside of a dockerfile.
        <img width="874" alt="Screenshot 2023-06-03 at 1 36 33 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/5ad8db1a-2d4f-4394-9fc2-0c6a64908ddb">
       $<Variable> tells docker that it needs to search for an env variable with name "Variable" and plug its value.
