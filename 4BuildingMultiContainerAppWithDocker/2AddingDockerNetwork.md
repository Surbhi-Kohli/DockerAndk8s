We will list down all networks via ``docker network ls``.
We create a new network via ``docker network create <networkName>``  -> ``docker network create goals-net``  
<img width="688" alt="Screenshot 2023-07-27 at 8 08 34 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/62ce29bc-35c6-47fe-b73b-939793b760ba">

## Adding mongodb container to the network
<img width="675" alt="Screenshot 2023-07-27 at 8 11 32 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/c8b890ea-1c82-4a91-bcdb-a4847678c50e">  

We dont publish ports because that is not required.The communication in containers will happen within network.

## Adding backend container to the network:  


<img width="677" alt="Screenshot 2023-07-27 at 8 19 41 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/b7ab8125-eb97-461b-b8f8-4f03a1417e61">
  
 But this would fail as we have not corrected our backend code.Here the connection to mongodb is still made assuming that mongodb runs in local: 

 <img width="704" alt="Screenshot 2023-07-27 at 8 33 37 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/aa2789cf-41a4-4730-9ec9-6dbc30b71222">
 

<img width="701" alt="Screenshot 2023-07-27 at 8 21 39 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/97fa60e4-8f59-4015-ada3-74eac43fd8ab">

We need to mention the mongo db container  name instead of 'host.internal'  

<img width="479" alt="Screenshot 2023-07-27 at 8 42 17 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/b1e5bd39-ea8b-46a3-8cd4-ea99ec6f356e">

Now we rebuild the image and create container again.
<img width="703" alt="Screenshot 2023-07-27 at 8 40 47 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/029cc611-8ee7-4390-a58c-e7fc951b1e13">  

Now we need to add react container to network.For that also , we need to make code change in app.js of react code to replace localhost with node's container name ie ``goals-backend`` so that it can be resolved by docker to the IP address of the node-backend container.  

<img width="863" alt="Screenshot 2023-07-27 at 9 02 04 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/1e6de6ce-34eb-4ef0-aaf2-1d9c8351efec">    

Now now after the code change, we need to build react image again.
<img width="689" alt="Screenshot 2023-07-27 at 9 58 11 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/3c0b54fe-45bb-4b69-adb0-7cdfdce1e8a7">
We need to expose port of react container, as we want to run the application in local.
<img width="686" alt="Screenshot 2023-07-27 at 10 00 38 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/34d45da5-aa76-4d86-be5e-a0a266aefe63">

Now when we run our frontend app, we get error that :Failed to load resource.
<img width="1112" alt="Screenshot 2023-07-27 at 10 16 11 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/ad713fb6-65eb-4774-9635-d7c84297c05f">
The error occurs because the frontend react code, the js code runs in the browser and not on some server.And thats the key difference from the node code that is executed by the node runtime on the server,directly in the container.For react, it is different, ``npm start`` starts a development server which serves the basic react application and thats the only thing running in container.The react code however, is not executed inside the container, it always runs in the browser.And so the react code where we reach out to the backend service doesnt run in the container(where the docker would be able to translate the container name to node container's ip), but rather runs in the browser.
The browser has no idea of what goals-backend should be.  
<img width="588" alt="Screenshot 2023-07-27 at 10 30 38 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/c6a87344-1e9f-4024-8169-70775d8f3294">

So using container names here is not work here.So we should rather go back to localhost,because thats what the browser would be able to understand.Now we need to ensure that on localhost, endpoints of backend ie "/goals" can be reached.And so we still need to publish ports of backend code so that those can be accessed on local machine by the browser as the frontend app needs that.  

<img width="516" alt="Screenshot 2023-07-29 at 2 05 38 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/cb8dbbc2-8c62-4331-a09c-9884cd16ea2e">

Because react has browser side javascript code which doesn't run inside docker container.
After rebuilding the react image because of the localhost code change,run the container via:  
`` frontend % docker run --name goals-frontend  --rm -p 3000:3000 -it  goals-react``    

<img width="480" alt="Screenshot 2023-07-29 at 2 10 45 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/ac32921c-b12e-40e9-a301-e990d1932f2c">

The front-end container is able to communicate with the back-end container via our localhost because we published the backend container's internal port 80 to our localhost port 80.
``docker run --name goals-backend -p 80:80 -d --rm  --network goals-net goals-node``

My second question is: if there are multiple different web servers that are running on different localhost ports, how would the frontend container know to which localhost port it needs to send the data input if we do not specify the localhost port in the frontend url?
Yes, you would need to specify the correct ports in your requests in the frontend code.  In this example we didn't specify the port because it is using the default port for http traffic, 80.
