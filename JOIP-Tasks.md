# JOIP Tasks
CICD
----
> 2022-10-07
1. Create a jenkins master with 2 Nodes
   * First Node :
        - Any Linux
        - UserName & Key --> Tools To Be Installed MVN3, NVM, Python3, Pip3
      * Labels :
        - MVN3 JDK11 NVM PY3
   * Second Node :
        - Any Linux
        - UserName & PassWord --> Tools to be Installed Gradle, Python3, NVM
      * Labels :
        - GRADLE JDK11 NVM PY3
2. Declarative Pipeline for 
                         - OpenMRS --> SPRINT_1_DEV(Any Commit)
                                   --> SPRINT_1_REL(Night Build)
                         - Shopizer       
3. Artifactory Cloud Account

> 2022-10-09
* Build .NET Project in Jenkins Freestyle, Scripted & Declarative.

> 2022-10-16
* Shopizer --> Fork --> Main/Master(Branch) --> Devlop(Branch) --> Build for every 
                                                                   commit
                                          --> Release(Branch) --> Build at 11:00PM(IST)
* Promote DayBuild --> 10:30PM(IST) Merge Using --no-ff From Devlop to Release.
* Promote Release --> Release --> Main

> 2022-10-27
1. Create a Shopizer Dependencie & run it.
2. Create a GameofLife Dependencie & run it.
3. Run all maven Goals & Check it.

> 2022-11-01
* Write a Declarative Pipeline for SpringPetClinic/GameofLife/Shopizer/OpenMRS & Send the Artifacts To JFrog 
  1. Create JFrog Account
  2. Configure JFrog in Jenkins
  3. Write Diclarative Pipeline for sending Artifactory into JFrog.
  4. Install Sonarqube & Configure to Jenkins.
  5. Write Declarative Pipeline for SpringPetClinic/GameofLife/Shopizer/OpenMRS Using Sonarqube.
## Terraform
> 2022-10-28
1. Create an aws ec2 with cli configured & Create an AMI of that with Packer.
2. Node --> Workspace --> /home/ubuntu/ntier --> Manually Terraform init
3. Create resources in multiple regions with Terraform template at a single shot. Find 
out the Option? 

> 2022-11-01
* AWS :
  * Write a Terraform code to Create AutoScalling Group with Minimum 1 ec2 and Maximum 3 ec2.
  * Configure Health Checks with TCP.
  * Use Packer to Create an AMI 
  * Do this with Jenkins

> 2022-11-05
* AWS :
  * One VPC
  * Two Subnets
  * One EC2
  * Backend (create S3 Bucket & DynamoDB Manually & Configure Backend)
* Do this from Cloud Formation

> 2022-11-11
* Create a Terraform Template for Following Scenario
* Architecture 
![Preview](Screenshot 2022-11-30 214020.png)
* Things to be taken Care of :
  * Use Workspace & Backends
  * Optionally you can also use existing modules from registry
  * Use null resource for provisioning
  * Steps for installing the application
  ```
    git clone https://github.com/gothinkster/angular-realworld-example-app.git 
    cd angular-realworld-example-app 
    npm install -g @angular/cli 
    npm install
    # To start the application http://localhost:4200 
    # ng serve ("ng serve --host 0.0.0.0")
  ```
  * Try making ng serve a linux daemon.

> 2022-11-30
### Docker

* Task-01
  1. Create VM & Install Docker
  2. Create Docker Container With Attached Mode
  3. Create Docker Container With Dettached Mode
  4. List all the Images
  5. List all Running Containers
  6. Remove all Exited Containers
  7. Remove all Un-Used Images
  8. Run the Docker Pull
  9. Create Container with Interactivemode and Run PS Command Inside the Container
  10. Create Container and Install Nginx
  11. Create Nginx Image Without Writting Dockerfile
  12. Open Cheatsheet and Practice all Docker Commands
![PreView](img20221130115350.jpg)