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


## What is Kubernetes exactly??
With Kubernetes , we have a way of defining our deployments, scaling of containers, monitoring and replacement of containers independent of the cloud service that we use.Kubernetes is an open source system and a defacto standard for orchestrating container deployment.  
<img width="709" alt="Screenshot 2023-09-10 at 4 09 09 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/5cda9528-ea5e-47e5-8180-7f7121e9b454">

Kubernetes allows us to write down a kubernetes configuration file, where we define our desired deployment like which containers we want to deploy, how many instances, scaling up and replacement.
That configuration can be passed via certain tools to any cloud provider or any machine which can pick the config to create resources and deployment specified.  
<img width="645" alt="Screenshot 2023-09-10 at 4 24 31 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/239fb9f6-c200-4895-a11e-67a47b2366e1">

