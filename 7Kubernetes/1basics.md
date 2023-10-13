Kubernetes, also known as K8s, is an open-source system for automating deployment, scaling, and management of containerized applications.
It is not a single software,It is a collection of several things that help you with container deployment.
We may have certain problems in case of manual deployment when we manually handle servers:

<img width="747" alt="Screenshot 2023-09-10 at 3 08 57 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/b6477029-4036-47d5-8d53-4cf96b97cb14">
1.Because of container crash, your app might not be reachanble any more in case you dont quickly replace your container.In manual deployments, you also have to manually monitor your containers and manually replace them.  
2.You might need to scale up or down the running instances of your container as your workload/traffic increase or decreases.
3.You may need to run multiple containers from same image (to scale up/down as workload increases/decrease)in case of app that transforms image files uploaded to some folder.If more and more images keep coming in, u might need to run multiple containers out of that image that run different image files.
4.FOr http trafic, we want to evenly distribute across instances(containers).
Services like AWS ECS can help us to solve the problems to some extent.  
a.It does check the health ofour containers to see if they are still up and running and will automatically restart containers when they crash.    
b.It also can handle auto-scaling and load-balancing.  
  
<img width="728" alt="Screenshot 2023-09-10 at 3 31 16 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/bfdf3e06-07ed-46ab-aca7-aecd9ca173c9">
But using a service like AWS ECS locks us into that service. In case we plan on switching to another service, we will have to manually update configs as per the new service's framework. 
<img width="678" alt="Screenshot 2023-09-10 at 3 34 32 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/584356a0-bb88-4b6a-a151-83406d30f2ee">


## What is Kubernetes exactly??
With Kubernetes , we have a way of defining our deployments, scaling of containers, monitoring and replacement of containers independent of the cloud service that we use.Kubernetes is an open source system and a defacto standard for orchestrating container deployment.  
<img width="709" alt="Screenshot 2023-09-10 at 4 09 09 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/5cda9528-ea5e-47e5-8180-7f7121e9b454">
K8s can help in monitoring containers and replace them if they go down.
Kubernetes allows us to write down a kubernetes configuration file, where we define our desired deployment like which containers we want to deploy, how many instances, scaling up and replacement.
That configuration can be passed via certain tools to any cloud provider or any machine which can pick the config to create resources and deployment specified.  
<img width="645" alt="Screenshot 2023-09-10 at 4 24 31 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/239fb9f6-c200-4895-a11e-67a47b2366e1">  

Config file:standardized way of describing.
<img width="758" alt="Screenshot 2023-10-12 at 11 21 37 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/8e44bdd4-e287-4c95-8c11-abbadf921e82">

<img width="767" alt="Screenshot 2023-10-12 at 11 23 55 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/d1dffca3-2a2b-4cdd-8c38-98accf0aebc5">

## K8s is like Docker compose for multiple machines

## Core kUbernetes Concepts and architecture:
In kubernetes, a contianer is managed via a POD.POD is the smallest possible unit in the k8s world,which u can define in config file that k8s can create.POD holds/runs container(s).
This pod runs inside a worker-node.WOrker nodes can be machines/virtual instances with certain amout of cpu and memory.You can have more than one pod running in a worker node.
Worker node also needs a proxy which is actually another tool that k8s sets up for u to control the network traffic of the pods on the worker node.
Master node controls all the worker nodes.You let k8s and control pane do heavy lifting ,while u developer just deifine the end state the k8s should keep in mind.

Theoretically u can have 1 machine which acts both master and worker node.But for bigger deployments,
master node might also be split across multiple machines to ensure high availability.Ur worker machines will be other machines independent of the master node machine.
The COntrol Plane is actually a collection of different services which are running on the master node.
All together a cluster is formed(containing master and worker) and therefor 1 network is formed in which all are conected.Ur master node sends instructions to cloud provider api to tell that cloud provider to create its cloud provide resources to replicate this big picture on that cloud provieder.
On aws , it will create all ec2 instances , load balancer,etc required to hav
e this k8s network ,with a master ec2 instance and other worker node ec2 instances.
<img width="1115" alt="Screenshot 2023-10-13 at 9 26 21 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/b814fe18-ab44-4d77-b276-4786ec66fd7d">


<img width="658" alt="Screenshot 2023-10-13 at 9 30 09 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/b09865dd-d53d-4c33-86cc-6c53b140b584">
