We need to add data persistence for our mongodb container and also need to limit the access:
<img width="651" alt="Screenshot 2023-07-29 at 2 58 34 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/9767623a-3130-4395-ba8c-3f8f719bb6de">

## Current scenario:

If we add a goal to our mongodb via frontend and then stop the mongodb container  .If we restart the container, the previous goal would have been deleted from mongodb and would not show on the UI.Thats because when we stop the container, the container gets removed and also all the data stored in the container is lost.

<img width="502" alt="Screenshot 2023-07-29 at 3 04 58 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/fb9015da-ab4b-45aa-abd7-7c6f00e1a758">

So we need to ensure that we detach that data from container shutdown.The data should survive container tear down and removal.For that we can add a volume.We can check the official mongo image info on docker hub and find that the folder path where the container stores the  db data is ``/data/db``  
## Adding named volume
<img width="752" alt="Screenshot 2023-07-29 at 3 49 04 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/55f93a7d-d38f-4bae-a724-c28ee0572ac8">
Now we can create a named volume that maps  the container location where db data is stored to some location in host machine where the data folder would get created and the info will get stored.
``docker run --name mongodb -v data:/data/db --rm -d --network goals-net mongo``
Now we can add some goals and stop the mongodb container.On restart using the above command again, we see that on the UI, the previous goals persist.

## Security of the mongodb: Preventing access to our database

<img width="794" alt="Screenshot 2023-07-29 at 4 19 31 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/40ef802b-b81e-41ab-a054-07037f798bfe">
FOr Authentication and security , mongodb supports 2 env variables ``MONGO_INITDB_ROOT_USERNAME`` and ``MONGO_INITDB_ROOT_PASSWORD``
When we use these environment variables then the database inside of the mongodb container will be created such that this username and password is required to access it.
This will enforce that other containers trying to access the db provide the username and password.
We will now run the mongodb container mentioning the environment variables 
``docker run --name mongodb -v data:/data/db --rm -d --network goals-net -e MONGO_INITDB_ROOT_USERNAME=surbhi -e MONGO_INITDB_ROOT_PASSWORD=passecret  mongo``
But now we navigate to our frontend app on the UI, we will see that we are not

<img width="1129" alt="Screenshot 2023-07-29 at 4 33 24 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/d67f7677-6f0b-4c1e-ba6f-cce83e344d36">
