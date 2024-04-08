Docker Revision
---------------
#### Installing JAVA 8 in Alpine Image
* Took `alpine` version `3.19` and running it in interactive mode. `docker container run -it alpine:3.19 /bin/sh`
* In the container installed java with below commands.
  ```
  apk update
  apk search java
  apk add openjdk8-jdk
  java -version
  ```
* Writing `Dockerfile` with reference of above commands
  ```Dockerfile
  FROM alpine:3.19
  LABEL author=venkatesh
  RUN apk update && apk add openjdk8-jdk && java -version
  ```
* Now building the docker image with `docker image build -t myjava8:1 .`

#### Building a sample java project
* For this activity I took a open source application developed on spring frame work, [Spring Pet Clinic](https://github.com/spring-projects/spring-petclinic)
* The project needed Java-17, GIT, Maven.
* Manual build steps for project `docker container run -it alpine:3.19 bin/sh`.
  ```
  apk update
  apk add openjdk17-jdk
  apk add git
  apk add maven
  git clone https://github.com/spring-projects/spring-petclinic.git
  cd /spring-petclinic/
  mvn package
  cd target/
  java -jar spring-petclinic-3.2.0-SNAPSHOT.jar
  ```
* Manual deployment is done and the application is accessable over 8080 port.
* Now writing the `Dockerfile` with relevent instructions.
  ```Dockerfile
  FROM alpine:3.19
  LABEL author=venkatesh
  ARG SAMPLE_PROJECT=https://github.com/spring-projects/spring-petclinic.git
  RUN apk update && apk add openjdk17-jdk git maven
  RUN git clone ${SAMPLE_PROJECT}
  WORKDIR spring-petclinic/
  RUN mvn package
  EXPOSE 8080
  CMD java -jar /spring-petclinic/target/spring-*.jar
  ```
* With the above `Dockerfile` build the image `docker image build -t petclinic:1 .`
* After sucessful build we will see image in local docker host machine `docker image ls` or `docker images`
* Now running the container with the image `docker contianer run -d -P --name mypetclinic1 petclinic:1`
* With `-P` docker host will assign a free port to container exposed port, we can assing our desired free port to container with `-p 8000:8080`.
* Application deployed sucessfully.

#### Building Docker Image from Multi-Stage docker image build and Running the application with Non Root User
* In the above docker image we have done two moddifications.
    1. Running application with Non Root Privilege user, which will restirc the application to have sudo access.
    2. And with multistage build we can reduce the image size.
  ```Dockerfile
  # Multi Stage Build
  # First Stage
  FROM maven:3.9-amazoncorretto-17 as build_one
  LABEL author=venkatesh
  ARG SAMPLE_PROJECT=https://github.com/spring-projects/spring-petclinic.git
  # ADD ${SAMPLE_PROJECT} /spring-petclinic
  RUN yum install git -y
  RUN git clone ${SAMPLE_PROJECT}
  WORKDIR /spring-petclinic
  RUN mvn package
  
  # Finale stage
  FROM alpine:3.19
  ARG HOME_DIR=/spclinic
  ARG NRUSER=spclinic
  ARG USER_SHELL=/bin/sh
  RUN apk update && apk add openjdk17-jdk
  RUN adduser -h ${HOME_DIR} -s ${USER_SHELL} -D ${NRUSER}
  USER ${NRUSER}
  COPY --from=build_one --chown=${NRUSER}:${NRUSER} /spring-petclinic/target/spring-*.jar ${HOME_DIR}/spring-*.jar
  WORKDIR ${HOME_DIR}
  EXPOSE 8080
  ENTRYPOINT ["java", "-jar", "spring-*.jar"]
  ```
#### Docker Volumes
* Multiple types of [Docker Volumes](https://docs.docker.com/storage/volumes/)
    1. Bind Mount
    2. Volume Mount
    3. tmpfs mount
    * [Docker Volume Plugins](https://docs.docker.com/engine/extend/plugins_volume/)
