 ## Dockerizing mongodb:

``docker run --name mongodb --rm -d -p 27017:27017`` 
Ports are published so as to expose the container to the local , so that the non dockerized backend service running on local can communicate with it.

<img width="560" alt="Screenshot 2023-07-18 at 10 52 38 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/2760ebad-3047-49ad-bd4b-14bfbae693bf">

If in case the backend, (the service that talks to mongodb) is not dockerized, it talks to mongo over a port as if it is running on local.So we need to expose a port of mongo container to local machine and thats why we use -p flag

## Dockerizing node app
Add Dockerfile in backend code:
         
          FROM node
          
          WORKDIR /app
          
          COPY package.json .
          
          RUN npm install
          
          COPY . .
          
          EXPOSE 80
          
          CMD ["node", "app.js"]


Build image via ``docker build -t goals-node .``          
Then run the container:  
<img width="693" alt="Screenshot 2023-07-18 at 10 58 07 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/8ec1af6c-2bca-4d67-a31b-d5191e392950">

This fails as the backend service is trying to reach out to mongodb on its container's port .
<img width="572" alt="Screenshot 2023-07-18 at 11 00 06 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/01d2c497-dca1-46eb-bbd9-dbc701cbd249">


This needs to be updated to translate to local machine.Now u will have to rebuild image and then re run container.Now it would successfully connect to mongodb.But now the react app, that is not dockerized would not be able to talk to the node backend.
You should be publishing a port of node backend 
docker run --name goals-backend --rm -d -p 80:80 goals-node 
Conatiner's internal port 80 is exposed to local system's 80
