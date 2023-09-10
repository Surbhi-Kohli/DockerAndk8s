Kubernetes, also known as K8s, is an open-source system for automating deployment, scaling, and management of containerized applications.

We may have certain problems in case of manual deployment when we manually handle servers:

<img width="747" alt="Screenshot 2023-09-10 at 3 08 57 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/b6477029-4036-47d5-8d53-4cf96b97cb14">
1.Because of container crash, your app might not be reachanble any more in case you dont quickly replace your container.In manual deployments, you also have to manually monitor your containers and manually replace them.
2.You might need to scale up or down the running instances of your container as your workload/traffic increase or decreases.

Services like AWS ECS can help us to solve the problems to some extent.
a.It does check the health ofour containers to see if they are still up and running and will automatically restart containers when they crash.  
b.It also can handle auto-scaling and load-balancing.  

<img width="728" alt="Screenshot 2023-09-10 at 3 31 16 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/bfdf3e06-07ed-46ab-aca7-aecd9ca173c9">
But using a service like AWS ECS locks us into that service. In case we plan on switching to another service, we will have to manually update configs as per the new service's framework. 
<img width="678" alt="Screenshot 2023-09-10 at 3 34 32 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/584356a0-bb88-4b6a-a151-83406d30f2ee">
