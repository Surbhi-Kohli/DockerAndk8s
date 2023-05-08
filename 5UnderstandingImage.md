 # Images are Read Only
 
 If you edit/update your source code,(in our case, the nodejs code),you can't expect that the image to be updated and the container created/run from that image to show the updated code.
   We will have to rebuild the image to copy our updated source code into a new image.Images are locked once u build them.
   An image is actually a closed template.The Dockerfile instructions are read to create an image and then the image is locked.
   
 # Understanding Image layers
 
 Images are layer based.
