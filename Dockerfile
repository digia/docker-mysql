# MySQL
#
# VERSION           0.1
# DOCKER-VERSION    0.10

FROM ubuntu:12.04

# Make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update   
RUN apt-get upgrade -y

# Install MySQL server
RUN apt-get -y install mysql-server

# Bind MySQL to 0.0.0.0 for remote access (outside the container)
RUN sed -i -e "s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# Add the boostrap script
ADD ./bootstrap.sh /opt/bootstrap.sh

# Expose port 3306 for MySQL
EXPOSE 3306

# Run the bootstrap script
CMD ["/bin/bash", "/opt/bootstrap.sh"]
