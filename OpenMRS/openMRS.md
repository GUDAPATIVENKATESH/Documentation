# OpenMRS K8s Deployment
* OpenMRS source code [Copy From Here](https://github.com/openmrs/openmrs-core.git)
* Write Dockerfile for building Docker Image
```Dockerfile
FROM maven:3-jdk-8 as build
RUN git clone https://github.com/openmrs/openmrs-core.git && cd openmrs-core && mvn clean package

FROM tomcat:8
ADD --from=build /webapp/target/openmrs.war /usr/local/tomcat/webapps/openmrs.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
```