# docker rpi-sonar-scanner, a simple raspberry pi sonar scanner container
Runs a small sonar scanner

### Create an image and an container with Script files
- The script "build.sh" creates a image from Dockerfile with the tag "paperinik/rpi-sonar-scanner". 
- The script "run.sh" needs three arguments. The first argument is the sonar server, the second the sonar port and 
the third is the path to be analized. 

## Create the container by hand
Create the container and store the data outside of your container run: 
"docker run --env SONAR_HOST=localhost --env SONAR_PORT=9000 -v /media/usbraid/docker/sonar-scanner:/var/scanner paperinik/rpi-sonar-scanner"

