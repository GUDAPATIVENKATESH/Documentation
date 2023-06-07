Install MySQL 8.0 on Red Hat Enterprise Linux 7/8:
--------------------------------------------------
* MySQL is an open-source relational database management system. Its name is a combination of "My", the name of co-founder Michael Widenius's daughter, and "SQL", the abbreviation for Structured Query Language.


1. Login as root user. Download and add MySQL Yum Repository to Linux Repository
```
wget https://repo.mysql.com/mysql80-community-release-el6-1.noarch.rpm
```

2. Install the downloaded package by using below command
```
yum localinstall mysql80-community-release-el7-1.noarch.rpm
```

3. Verify that the MySQL Yum repository has been added successfully
```
yum repolist enabled | grep "mysql.*-community.*"
```

4. Install latest MySQL with below command:
```
yum install mysql-community-server
```

5. Start MySQL Server, also enable it so that it can start it its on using below commands:
```
systemctl start mysqld
systemctl enable mysqld
```

6. Verify the status of the same.
```
systemctl status mysqld
```

7. Secure MySQL Server:
* When MySQL 8.0 version is installed, temporary password for root is created. Run below command to list the password.
```
cat /var/log/mysqld.log | grep 'temporary password' 
```

8. Get the password and then run below command.
```
mysql_secure_installation
```
* Enter the password you got in previous command, then change it with a new password.

### Now test the configuration:

1. Check the status of mysql server.
```
systemctl status mysqld
```

2. Log in the mysql.
```
mysql -u root -p
```
* Enter the password, you have successfully logged in to the mysql.

3. Run different mysql commands to verify that its working fine.
```
show databases;
create database new;
select * from mysql.user;
```

