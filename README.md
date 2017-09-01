# Sonar Scanner

![docker_logo](https://raw.githubusercontent.com/brunocantisano/rpi-sonarqube/master/files/docker.png)![docker_sonar_scanner_logo](https://raw.githubusercontent.com/brunocantisano/rpi-sonar-scanner/master/files/logo-sonar-scanner.png)![docker_paperinik_logo](https://raw.githubusercontent.com/brunocantisano/rpi-sonar-scanner/master/files/docker_paperinik_120x120.png)

This Docker container implements a Sonar Scanner.

 * Raspbian base image.
 
### Installation from [Docker registry hub](https://registry.hub.docker.com/u/paperinik/rpi-sonar-scanner/).

You can download the image with the following command:

```bash
docker pull paperinik/rpi-sonar-scanner
```

# How to use this image

Exposed volume
----

The image exports one volume: `/var/scanner`, used to store all the codes to be analyzed.

Use cases

Environment variables
----

1) This image uses environment variables to allow the configuration of some parameteres at run time:

* Variable name: `SONAR_VERSION`
* Default value: 3.0.3.778
* Description: You should change this value if you want to build the container using another version.
----

* Variable name: `SONAR_SCANNER_OPTS`
* Default value: -Xmx512m
* Accepted values: Increase the memory via the SONAR_SCANNER_OPTS environment variable. TroubleShooting: Java heap space error or java.lang.OutOfMemoryError.
* Description: You should not change this value.
----

* Variable name: `PATH`
* Default value: $PATH:/sonar-scanner-3.0.3.778/bin
* Description: You should not change this value.
----

2) If you'd like to run the container:
```bash
docker run -e SONAR_HOST=192.168.1.30 \
           -e SONAR_PORT=9408 \
           -v /media/usbraid/docker/sonar-scanner/sonarqube-scanner:/var/scanner \
           -it paperinik/rpi-sonar-scanner sonar-scanner
```
