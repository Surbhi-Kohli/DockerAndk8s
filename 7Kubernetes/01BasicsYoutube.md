Kubernetes: K8S(numeronyms) k=1st alpha, S=last alpha, 8= alphabet count in the middle
Internationalisation = i18n
Previous applications were mainly monolithic

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

Feature | K8s | swarm | 
--- | ---- | ---- | --- |
installation and cluster configuration | complicated and time consuming | fast and easy | 
--- | --- | --- | --- |
Supports | K8s can work with almost all container types  | fast and easy | 
