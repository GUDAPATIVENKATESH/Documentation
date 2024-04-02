MongoDB - 4.4.29 Installation in RHEL 8.8 from .rpm Binaries
------------------------------------------------------------
* Follwed [MongoDB](https://www.mongodb.com/try/download/community) official site
* Download MongoDB .rpm [server](https://repo.mongodb.org/yum/redhat/8/mongodb-org/4.4/x86_64/RPMS/mongodb-org-server-4.4.29-1.el8.x86_64.rpm) & [shell](https://repo.mongodb.org/yum/redhat/8/mongodb-org/4.4/x86_64/RPMS/mongodb-org-shell-4.4.29-1.el8.x86_64.rpm) also [Database-Tools](https://fastdl.mongodb.org/tools/db/mongodb-database-tools-rhel90-x86_64-100.9.4.rpm) files in `/tmp`.
* Install .rpm packages locally with `sudo yum localinstall *.rpm`.
* Check `mongo` and `mongod` versions
* Check the `mongod` status with 
    ```
    sudo systemctl status mongod
    ```
* Add mentioned entries to `/etc/mongod.conf` to bind mongod service to ipv4 and private IP.
    ```
    # network interfaces
    net:
      port: 27017
      bindIp: 0.0.0.0
    ```
* Then `start` the `mongod` service 
    ```
    sudo systemctl start mongod
    ```
* To login into `MongoDB` enter `mongo` command prompt.
* Then create a database, the below command will create a database called `venkatesh_db` & it will come under use.
    ```
    use venkatesh_db
    ```
* Then create a `USER` with `PASSWORD` for the `venkatesh` database with `owner` privilage.
    ```
    db.createUser(
    {
        user: "venkatesh",
        pwd: "1234567890",
        roles: [
            {   
                role: "dbOwner", db: "venkatesh_db"
            }
        ]
    }
    ) 
    ```
* Then create collection with below command
    ```
    db.createCollection("MyCollection")
    ```
* After this secure the `MongoDB` database with `USER` and `PASSWORD`, add below entries to `/etc/mongod.conf` file.
    ```
    security:
      authorization: enabled
    ```
* Then, restart the `mongod` service to apply the configuration changes.
    ```
    sudo systemctl restart mongod
    sudo systemctl status mongod
    ```
* Now, login into MongoDB with `USERNAME` and `PASSWORD` with below command.
    ```
    mongo -u venkatesh -p 1234567890 <private_ip_of_mongodb>/venkatesh_db
    ```
* To take `MongoDB` backup, use below command
    ```
    mongodump --db=venkatesh_db -u=venkatesh -p=1234567890 --out=/root/mongo_bkp
    ```
* To add backed up data to `MongoDB`
    ```
    mongorestore --db venkatesh_db --username=venkatesh --password=1234567890 .
    ```
* We can add different types of formats of data to MongoDB.
With below command we can add data in .CSV file to MongoDB database.
    ```
    mongoimport --db venkatesh_db --username=venkatesh --password=1234567890 --collection M