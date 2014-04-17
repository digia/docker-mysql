docker-mysql
============

Mysql container for docker

How to use
----------
1) Fork the repository

2) Edit the user password within bootstrap.sh - this is currently set to ['idareyounottochangethis'](https://github.com/digia/docker-mysql/blob/master/bootstrap.sh#L8)

3) Build the docker container

**Example:**
```bash
$ sudo docker build -t digia_mysql github.com/digia/docker-mysql
```
4) Run the container
```bash
$ sudo docker run -d -p 3306:3306 -v /data/mysql:/var/lib/mysql digia_mysql
```
NOTE: If you do not use -v to mount a volume within the container you run the risk of loosing all of your MySQL data!!
