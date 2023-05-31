We can restrict what gets copied in the image although in our copy command we mention 
COPY . . , by use of .dockerIgnore file. 
<img width="645" alt="Screenshot 2023-05-31 at 6 02 33 PM" src="https://github.com/Surbhi-Kohli/DockerAndk8s/assets/32058209/6705ff37-363a-473d-989f-86b6f015ac44">
We can add node_modules in the .dockerIgnore file so that in case the host app has node_modules, dont get copied to the image, instead, during the image build the npm install runs and installs the node_modules.
Otherwise our host machine's node_modules would override the node_modules created during image build, which can create problems in case our host app's node_modules are outdated.And also our copy process would unnecessarily get longer and time consuming.

You can add more "to-be-ignored" files and folders to your .dockerignore file.

For example, consider adding the following to entries:

                  Dockerfile
                  .git
This would ignore the Dockerfile itself as well as a potentially existing .git folder (if you are using Git in your project).

In general, you want to add anything which isn't required by your application to execute correctly.
