# GAMEOFLIFE K8S DEPLOYMENT
* get the source from git hub [ReferHere](https://github.com/GUDAPATIVENKATESH/game-of-life.git)
* Build a war file from gameoflife source code.
* Build an Docker image from war file
```Dockerfile
   FROM tomcat:8-jdk8
   EXPOSE 8080
   ADD https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/gameoflife.war /usr/local/tomcat/webapps/gameoflife.war
   CMD ["catalina.sh", "run"]
``` 
* Then push the image into docker hub registory
* Now create a K8s deployment workload and service
```yaml
---
#namespace
apiVersion: v1
kind: Namespace
metadata: 
  name: my-namespace
  namespace: joip-task
spec: 
  conditions: 
    - reason: for-practice
  phase: one
---
#Deployment
apiVersion: apps/v1
kind: Deployment
metadata:
  name: gameoflife
  namespace: joip-task
spec: 
  minReadySeconds: 9
  replicas: 2
  selector: 
    matchLabels:
      app: gameoflife
  strategy:
    rollingUpdate: 
      maxSurge: 50%
      maxUnavailable: 50%
    type: RollingUpdate
  template:
    metadata: 
      name: gol-temp
      labels: 
        app: gameoflife
      namespace: joip-task
  spec:
    containers: 
      - name: gameoflife
        image: venkateshg1234/gol:1.0
        ports: 
          - containerPort: 8080
            protocol: TCP
        command:
          - 0.0.0.0/8080


---
#Service
apiVersion: v1
kind: Service
metadata:
  name: gol-svc
  namespace: joip-task
spec:
  type: LoadBalancer
  selector:
    matchLabels:
      app: gameoflife
  ports:
    - port: 35001
      targetPort: 8080
      protocol: TCP
```
