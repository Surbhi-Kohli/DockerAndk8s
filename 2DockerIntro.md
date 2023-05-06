Docker is a container technology.A tool for creating and managing containers

## What is a container?
Container=A standardised unit of software.
(A package of code and dependencies to run that code (eg nodejs code + nodejs runtime).

The same container always yields the exact same application and execution behaviour.No matter where or by whom it might be executed
Support for containers is built into modern os.
Docker simplifies the creation and management of such containers

__Why containers__??
Why do we want independent, standardised “applications packages”??
Problems without containers:
  * We often have different prod and dev envs.We want to build and test in exactly the same env(runtime, language, framework version) 
      setup as we later run our app in.This ensures that our app works exactly as tested.
      Example: u have a nodejs code that requires node v14(which has top level awai and the code can’t run on lower v of nodejs).
      The problem is, we might be having the version of node 14 on our local env, but it might not be available on the remote server where
      it is to be hosted.And the application would not work there.Containers would solve suck issues

* Different dev ends within a team or a company can be a problem:With containers, it is easy to share a common env setup with new employees or
   colleagues.
* Clashing tools/versions between different projects can create problems which can be easily solved by containers.

Can we not use Virtual Machines/Virtual OS instead of Containers?
With VMs , we have our host os(Our system’s OS).On the top of that, there will be the VM’s OS.On this OS, we can install libraries, 
dependencies and tools as well as our application encapsulated in the vm.OS needs to be installed on each of the VM,this is a serious overhead.
All the resources like memory, ram ,cpu cores get virtualised by a hypervisor. This means the resources once allocated to a VM by the hypervisor are fixed.They cant be allocated/de-allocated on need basis.
This wastes lot of hard drive  and tends to be slow.

<img width="1068" alt="VM" src="https://user-images.githubusercontent.com/32058209/235980092-196c73d5-332a-465f-9540-f31867efa3c0.png">


Pros of virtualisation:
Separated envs,environment specific configs are possible, env configurations can be shared and reproduced reliably.


Cons of virtualisation:
Redundant duplication, waste of space.Performance can be slow ,boot times can be long.Reproducing on another computer/server 
is possible but may still be tricky as you have to setup the vm exaclty on all machines.You would have to replicate everything of the vm 
on the production.
This is __hardware level Virtualisation__.All the resources like memory, ram ,cpu cores get virtualised by a hypervisor. This means the resources once allocated to a VM by the hypervisor are fixed.They cant be allocated/de-allocated on need basis.

Using Containers:
<img width="1121" alt="Screenshot 2023-05-03 at 3 09 51 PM" src="https://user-images.githubusercontent.com/32058209/235982527-8ea8f05a-4bf8-4353-9f0c-4d40e118a139.png">
With Containers, we still have our host os,but we dont install a couple of machines inside our machine.
Instead ,we make use built in container support which our host os has, or emulated container support(something that docker will take care of).
We run a tool called Docker Engine(light weight tool).
All this will be done by Docker.And we finally spin up containers.
This contains our code and crucial tools and runtimes our code needs like nodejs .But they dont contain a bloated os or any extra tools.
They might contain a lightweight version of an OS layer..
Also the resources from host machine can be allocated/de-allocated based on the need of the container.The container only requests for resources when it is running.When the container stops running,it returns the resources.

A great thing about containers is that U can configure and describe them with a config file and u can share that file with others ,
so that they can recreate the container 
Or u can build the container into something which is called an image , which u can share to others.

<img width="1168" alt="Screenshot 2023-05-03 at 3 15 39 PM" src="https://user-images.githubusercontent.com/32058209/235985139-5b6d3681-8ab7-4021-b619-fa0e218fcf94.png">
<img width="362" alt="Screenshot 2023-05-06 at 3 07 41 PM" src="https://user-images.githubusercontent.com/32058209/236616249-cd17c240-04c0-488e-a709-fbab10e31517.png">
Docker is a set of Paas.For Paas ,we usually deal with OS level.Docker does OS level virtualization.


## Advantages of Docker
 <img width="514" alt="Screenshot 2023-05-06 at 10 39 57 PM" src="https://user-images.githubusercontent.com/32058209/236637741-ed154360-b420-47f2-8436-6b133ef3e6e0.png">

 
## Docker setup

<img width="1291" alt="Screenshot 2023-05-03 at 3 32 28 PM" src="https://user-images.githubusercontent.com/32058209/236228703-7fcfe91b-690f-480f-b5f8-10e447a37bff.png">
In linux u dont need docket desktop or docker toolbox as linux natively supports containerization and hence you can directly install Docker engine.
For windows and macos, u need to install docker desktop or docker toolbox which has the docker engine
__Docker Toolbox__ and __Docker Desktop__ are tools that bring docker to life in non linux os.


Docker desktop or docker toolboxcontains Docker engine, docker daemon and a CLI
<img width="765" alt="Screenshot 2023-05-04 at 7 54 38 PM" src="https://user-images.githubusercontent.com/32058209/236237122-70960bf9-be42-4f9f-b950-ffd31263f675.png">

<img width="376" alt="Screenshot 2023-05-06 at 2 41 13 PM" src="https://user-images.githubusercontent.com/32058209/236614966-0fe56d59-5b76-4ba4-9b67-4a1c833ff92a.png">


