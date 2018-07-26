FROM ubuntu:xenial

ENV TERM xterm-color
ENV DEBIAN_FRONTEND noninteractive

# Configure apt to avoid cruft
RUN echo 'APT::Install-Recommends "false";' > /etc/apt/apt.conf.d/norecommends
RUN echo 'APT::Install-Suggests "0";' > /etc/apt/apt.conf.d/nosuggests
RUN apt-get update
RUN apt-get -y install lsb-release wget

# Install the MySQL apt config
ADD https://dev.mysql.com/get/mysql-apt-config_0.8.10-1_all.deb /tmp
RUN dpkg -i /tmp/mysql-apt-config_0.8.10-1_all.deb
RUN apt-get update

# MySQL's mysql 8.0.11 community deb tries to run setcap,
# after which MySQL won't start (because docker drops all caps)
RUN chmod a-x /sbin/setcap
RUN apt-get -y install mysql-server

# Python stuff
RUN apt-get -y install python python2.7 python-pip python-setuptools python-wheel python-mysqldb
RUN pip install 'django<2'

COPY django_constraints /tmp/django_constraints
