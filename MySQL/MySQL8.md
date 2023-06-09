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

wget https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-8.0.3-rc-linux-glibc2.12-x86_64.tar.gz
     https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-8.0.33-linux-glibc2.28-x86_64.tar.gz

Installing MySQL in ubuntu 20.04 with generic bineries
------------------------------------------------------

* Download the tar file
```
sudo wget https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-8.0.3-rc-linux-glibc2.12-x86_64.tar.gz
```

* untar the tar file and copy that to /usr/local/
```
sudo tar -zxvf mysql-8.0.3-rc-linux-glibc2.12-x86_64.tar.gz -C /usr/local/
```
* Check this
```
sudo apt update
sudo apt install libncurses5 -y
```
* Check libaio is installed or not, if not install it
```
sudo apt install libaio -y
```

* Add mysql group
```
sudo groupadd mysql
```

* add mysql user, add the user false shell also add this user to mysql group
```
sudo useradd -r -g mysql -s /bin/false mysql
```

* check the mysql user is avialable or not 
```
getent passwd | grep mysql
```

* swith to /usr/local directory because the untared mysql files are copied there 
``` cd /usr/local/ ```

* create a sybolic link file from mysql untar file to mysql
```
sudo ln -s mysql-8.0.3-rc-linux-glibc2.12-x86_64 mysql
```

* check the symbolic link
```
ll mysql
```

* create mysql-files directories where mysql was present
```
sudo mkdir mysql-files
sudo chown mysql:mysql mysql
```

* change modes of the mysql-files
```
sudo chmod 750 mysql-files
```

* create mysql_log file and add it to mysql user and group
```
sudo mkdir mysql_log
sudo chown -R mysql.mysql mysql_log/
```

* create mysql cnf file in /etc/ with below content
```
sudo vi /etc/my.cnf
```
```
[client]

[mysqld]
basedir=/usr/local/mysql
datadir=/usr/local/mysql/data
log-error=/usr/local/mysql_log/mysql.err
```
* then
```
cd /usr/local/mysql
```

* Intialize mysql
```
sudo ./bin/mysqld --defaults-file=/etc/my.cnf --initialize --user=mysql --basedir=/usr/local/mysql --datadir=/usr/local/mysql/data
```

* tail the error log for temperary password
```
sudo tail -100f /usr/local/mysql_log/mysql.err
```
## temp pass: &1sS91kyiz!8
* copy the support files
```
sudo cp ./support-files/mysql.server /etc/init.d/mysql
```

* 
```
cd bin/
sudo ln -s /usr/local/mysql/bin/mysql /usr/bin
```

* to check the symbolic link 
```
ll /usr/bin/mysql
```
* creating service file for mysql
```
sudo nano /etc/systemd/system/mysql.service
```
```
[Unit]
Description=MySQL Server
Documentation=man:mysqld(8)
Documentation=http://dev.mysql.com/doc/refman/en/using-systemd.html
After=network.target

[Service]
ExecStart=/usr/local/mysql/bin/mysqld --daemonize --pid-file=/run/mysqld/mysqld.pid
User=mysql
Group=mysql
Restart=always

[Install]
WantedBy=multi-user.target

```
* start the mysql service
```
sudo systemctl daemon-reload
sudo systemctl start mysql
sudo systemctl status mysql
```

* login into mysql
```
mysql -u root -p
```

* to change password
```
alter user 'root'@'localhost' identified by 'jiojiojio';
```

* if you want to use the password into the my.cnf file
```
vi /etc/my.cnf
```
```
[client]
user=root
password=jiojiojio
[mysqld]
basedir=/usr/local/mysql
datadir=/usr/local/mysql/data
lod-error=/usr/local/mysql_log/mysql.err
```

* if you change the password file restart the mysql service 
```
service mysql restart
```