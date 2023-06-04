## Case 1: Container to www communication
Lets say we have an application that has the logic to talk to an api(to some website in the www) to send or fetch data.And we have to run it in a container, then our container must make it possible to send the request from the container to outside on the internet.  

<img width="268" alt="Screenshot 2023-06-03 at 10 59 55 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/fae6a77c-c7d7-4083-baaa-56da5ebfa23d">
  
You can communicate with web API's and web pages from inside your dockerized applications.You don't need any special setup or any changes to your code.Sending this HTTP request from inside the dockerized application works.It works just as it works without containers and without Docker.
## Case 2:Container to Local Host machine Communication 
There can be a scenario where the application running in a container needs to communicate with host machine.
<img width="499" alt="Screenshot 2023-06-03 at 11 07 17 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/cf6f7f13-baac-463a-9fbd-4975c62b8781">

## Case 3:Container to Container communication
This can be the case when the application running in your container wants to talk to another container.
<img width="661" alt="Screenshot 2023-06-04 at 1 50 03 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/04d2769f-cb5f-4843-bba8-a2a484489f9c">

With docker containers, it is strongly recommended and a best practice that every container should just do one main thing.So if u have a node application which also needs mongodb database,it is a recommendation that ur node application go into one container and one image,while your mongodb database uses another image and runs in another container. 
<img width="1071" alt="Screenshot 2023-06-04 at 1 56 13 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/cc2e4abb-b332-4caf-b9c7-2abf2eb70cf8">

