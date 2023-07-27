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

