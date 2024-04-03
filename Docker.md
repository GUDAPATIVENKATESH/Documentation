Docker Revision
---------------
#### Installing JAVA 8 in Alpine Image
* Took `alpine` version `3.19` and ean it in interactive mode. `docker container run -it alpine:3.19 /bin/sh`
* In the container installed java with below commands.
  ```
  apk update
  apk search java
  apk add openjdk8-jdk
  java -version
  ```
* Writing `Dockerfile` with above commands
  ```Dockerfile
  FROM alpine:3.19
  LABEL author=venkatesh
  RUN apk update && apk add openjdk8-jdk && java -version
  ```
* Now build the docker image with `docker image build -t myjava8:1 .`

#### Building a sample java project
* For this activity I took a open source application developed on spring frame work, [Spring Pet Clinic](https://github.com/spring-projects/spring-petclinic)
* The project need Java-17, GIT, Maven.
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
* Now write the `Dockerfile` with relevent instructions.
  ```Dockerfile
  FROM alpine:3.19
  LABEL author=venkatesh
  RUN apk update && apk add openjdk17-jdk git maven
  RUN git clone https://github.com/spring-projects/spring-petclinic.git
  WORKDIR spring-petclinic/
  RUN mvn package
  EXPOSE 8080
  CMD java -jar /spring-petclinic/target/spring-*.jar
  ```
* With the above `Dockerfile` build the image `docker image build -t petclinic:1 .`
* After sucessful build we will see image in local docker host machine `docker image ls` or `docker images`
* Now run the container with the image `docker contianer run -d -P --name mypetclinic1 petclinic:1`
* `-P` will help docker host to assign free port to container exposed port, we can assing our desired free port to container with `-p 8000:8080`.
* Application deployed sucessfully.
