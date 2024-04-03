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
