
              docker volume --help 
will give u a list of commands that u can run to manage docker volumes.

               docker volume ls //lists all the currently active volumes
               <img width="603" alt="Screenshot 2023-05-30 at 9 57 37 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/7f1e69aa-5152-42a5-8abf-9b59ded2bc76">

Bind mount doesn't show up in this list as it is not managed by docker.
 
                docker volume create <volumeName>// to create a volume.When u do docker run, u can use this named volume for a particular folder
 
 <img width="761" alt="Screenshot 2023-05-30 at 10 05 08 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/2038a5ae-7189-4fe1-badf-ce9f925ccaea">
