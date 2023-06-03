## Case 1: Container to www communication
Lets say we have an application that has the logic to talk to an api(to some website in the www) to send or fetch data.  
<img width="268" alt="Screenshot 2023-06-03 at 10 59 55 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/fae6a77c-c7d7-4083-baaa-56da5ebfa23d">
And we have to run it in a container, then our container must make it possible to send the request from the container to outside on the internet.

## Case 2:Container to Local Host machine Communication 
There can be a scenario where the application running in a container needs to communicate with host machine.
<img width="499" alt="Screenshot 2023-06-03 at 11 07 17 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/cf6f7f13-baac-463a-9fbd-4975c62b8781">
