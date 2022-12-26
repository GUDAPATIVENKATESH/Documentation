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
```yaml
---
#Deployment
apiVersion: apps/v1
kind: Deployment
metadata:
  name: petclinic
  namespace: joip-task
spec: 
  minReadySeconds: 9
  replicas: 2
  selector: 
    matchLabels:
      app: petclinic
  strategy:
    rollingUpdate: 
      maxSurge: 50%
      maxUnavailable: 50%
    type: RollingUpdate
  template:
    metadata: 
      name: petclinic-temp
      labels: 
        app: petclinic
      namespace: joip-task
  spec:
    containers: 
      - name: petclinic
        image: venkateshg1234/spc:1.0
        ports: 
          - containerPort: 8080
            protocol: TCP

---
#Service
apiVersion: v1
kind: Service
metadata:
  name: petclinic
  namespace: joip-task
spec:
  type: LoadBalancer
  selector:
    matchLabels:
      app: petclinic
  ports:
    - port: 35001
      targetPort: 8080
      protocol: TCP
```