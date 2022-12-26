# SPRINGPETCLINIC
* take vm with java-11 and maven installed
* clone SPC source from git 
* run maven build then it will create a jar file in target folder
* run the jar file
![PreView](download.png)
```#!/bin/bash
apt install openjdk-11-jdk maven git -y
git clone https://github.com/GUDAPATIVENKATESH/spring-petclinic.git
mvn package
cd spring-petclinic/target/
java -jar ./spring-petclinic-2.7.3.jar
```
# SpringPetClinic
```Dockerfile
FROM amazoncorretto:11
ADD https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar /spring-petclinic-2.4.2.jar
EXPOSE 8080
CMD ["java", "-jar", "/spring-petclinic-2.4.2.jar"]
```
# GameOfLife
```Dockerfile
FROM tomcat:8-jdk8
EXPOSE 8080
ADD https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/gameoflife.war /usr/local/tomcat/webapps/gameoflife.war
CMD ["catalina.sh", "run"]

```