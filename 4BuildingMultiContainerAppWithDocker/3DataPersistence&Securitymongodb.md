We need to add data persistence for our mongodb container and also need to limit the access:
<img width="651" alt="Screenshot 2023-07-29 at 2 58 34 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/9767623a-3130-4395-ba8c-3f8f719bb6de">

## Current scenario:

If we add a goal to our mongodb via frontend and then stop the container .If we restart the container, the previous goal would have been deleted from mongodb and would not show on the UI.Thats because when we stop the container, the container gets removed and also all the data stored in the container is lost.

<img width="502" alt="Screenshot 2023-07-29 at 3 04 58 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/fb9015da-ab4b-45aa-abd7-7c6f00e1a758">

So we need to ensure that we detach that data from container shutdown.The data should survive container tear down and removal.For that we can add a volume.We can check the official mongo image info on docker hub and find that the folder path where the container stores the data is ``/data/db``
<img width="752" alt="Screenshot 2023-07-29 at 3 49 04 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/55f93a7d-d38f-4bae-a724-c28ee0572ac8">
