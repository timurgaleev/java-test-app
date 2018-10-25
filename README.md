# CI/CD spring application linked MySQL through jenkins pipeline

This pipeline creates an application for checking for an update and if an update happens, the application is packed in a docker container and sent to the server (in this example, the AWS server was used).

All containers are sent to my docker hub.

Before your sent a new update, the pipeline removes the old version of the docker images.

## What you'll need
- Docker CE
- Jenkins

## Stack
- Docker
- Java
- Spring Boot
- MySQL
- Tomcat
- Maven

You can check the log by
~~~
docker logs provectus-test
docker logs mysql-provectus

Open http://localhost:8080 in browser and you should see the message.
