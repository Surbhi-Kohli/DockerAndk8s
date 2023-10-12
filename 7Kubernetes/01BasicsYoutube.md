Kubernetes: K8S(numeronyms) k=1st alpha, S=last alpha, 8= alphabet count in the middle
Internationalisation = i18n
Previous applications were mainly monolithic
K8s is written in golang.You can write manifest in json or yaml
Autoscalling of containers

Orchestration= container management
Kubernetes is an open source container management tool which automates container deployment,container scaling and load balancing.It schedules,runs and manages isolated containers which are running on virtual/physical or cloud machines.

Cloud vs Cloud native check

Online k8 playgrounds exist for learning, play with k8s, play with k8s classroom.
Installation:minikubes

## PROBLEMS WITH SCALING UP CONTAINERS without k8s
  * Containers can't communicate with each other
  * Autoscaling and load balancing is not possible
  * So containers had to be managed carefully

Docker swarm does exist for this, but still mostly k8s is used.

# Feature of k8s
* Orchestration(Clusterning of any number of containers running on different networks ie a container running on cloud communicates with container running on on-premise server)
* Autoscaling-Can do both vertical and horizontal scaling
* Auto-healing
* Load balancing
* Platform independent(Cloud/physical/virtual)
* Fault tolerance (In case of node/pod failure)
* Rollback(going back to previous version)
* Health monitoring of containers
* Batch execution(one time, sequential,parallel)

| Feature | #K8s | #swarm | 
| ---- | ---- | ---- | 
| installation and cluster configuration | complicated and time consuming | fast and easy | 
| ---- | ---- | ---- | 
| Supports | K8s can work with almost all container types: Rocket, Docker,ContainerD  | works with docker only | 
| ---- | ---- | ---- | 
| GUI | GUI available  | GUI not available | 
| ---- | ---- | ---- | 
| Data Volumes | Only shared with containers in same pod | Can be shared with any other container | 
| ---- | ---- | ---- | 
| Updates and Rollback | Process scheduling to maintain services while updating | Progressive updates and service health monitoring throughout the update | 
| ---- | ---- | ---- | 
| Autoscaling | Supports vertical and horizontal autoscaling  | does not support autoscaling |
| ---- | ---- | ---- | 
| Logging and monitoring | Inbuilt tool present for monitoring  | Uses 3rd party tools like splunk | 



## High level architecture of K8s(Master/slave or client server architecture):
K8s consist of a cluster: which has a master and worker nodes.There can be just one master 1 node,or 1 master multiple nodes, multiple masters or multiple nodes in a cluster.
The node contains the basic unit of k8s, which is called POD.U can create multiple pods in a node.Pod is the smallest unit which k8s controls.
Pods contain containers.
Generally we have 1 container in 1 pod,but we can have multiple as well.We can have more than 1 pod in a node.We can have 1 or more node in a cluster
<img width="386" alt="Screenshot 2023-10-12 at 10 38 56 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/bb4c3425-1e83-47e4-a6d6-65c3e307a393">

Cluster->node->pod->container->application
