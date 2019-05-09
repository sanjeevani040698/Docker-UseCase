# Docker-UseCase
This is a simple example of a web application deployed via a docker.


# Dockerfile

Dockerfile is the code that is used for building the image to be comtainerized. Here is the Dockerfile for the web application: 

FROM tomcat:9.0.1-jre8-alpine

ADD ./web_files /usr/local/tomcat/webapps/webapp   # public_html is the folder which contains the web application files like                        #index.html, style.css, log.jsp

CMD ["catalina.sh", "run"]

FROM command specifies the images that the our image will need for its deployment.                      
ADD command tells the location of web application files and maps them with the location inside the container.           
CMD tells the command to be executed on deloyment of the web application.             

# Web Application

The main aim of the application is to take input from the user (Name, Father's name, Mother's name etc), store the input obtained
in a directory inside container and map the the directory of input obtained, inside the container to a directory in the host.


The web application in this case consists of three files:

index.html: This is a html file to generate a form which accepts input from the user.

style.css: This is a css file used to enhance look and feel of the input form.

log.jsp: This is the jsp file which processes the input obtained and puts them into a directory in the container.


To map the the directory of input obtained, inside the container to a directory in the host, we need volume mount.

# Volume mount

Volume mounting is basically used to map a directory from the host machine to the container machine or vice-versa.
This helps as get access to the contaner directories when it is not in execution and can also be used as a backup in case of any 
kind of failure. 

Here, we need to map the directory of inputs inside the container to a directory inside the host machine using volume mounting.
This can be done by adding a mounting part to the run command as:

--v ./folder:usr/local/tomcat/DataFolder


# Build Command

sudo docker build -t image-name .

sudo: To get the authentication, (can get rid off it by applying sudo su before the build command)

docker: to execute docker daemon

build: to execute the docker file

image-name: to give a random name to the docker

. : to specify the directory of the Dockerfile


# Run command

sudo docker run -p 8090:8080 -v home/priya/Docker_usecase/folder:usr/local/tomcat/folder

-p : to map the port

8090:8080: to map the port 8090 of the host machine(any random port) to 8080 of the container(for tomcat)

-v home/priya/Docker_usecase/folder:usr/local/tomcat/folder: to map the latter folder of the container into the former folder of the host machine


# To observe live changes of the aplication

To deploy the application such that, whatever changes are made to the applcation files get immediately reflected on the the 
executing application (without having to rebuild and rerun the entire image), volume mount again comes to help.

For this, we need to map the web_files folder (the folder containing the application files to the webapp folder of the container
instead of adding it to the webapp folder in the Dockerfile.

Hence Docker file will become: 

FROM tomcat:9.0.1-jre8-alpine

CMD ["catalina.sh", "run"]

And in the run command we need to mount the application folder to the container webaap directory:

sudo docker run -p 8090:8080 -v home/priya/Docker_usecase/folder:usr/local/tomcat/folder


# Execution

To execute the application now, open a browser and type:

localhost:8090/webapp

This should bring the input form. On filling it, you will get a data stored message.

Now, check the folder on the host machine to get the directory of the input entered.
