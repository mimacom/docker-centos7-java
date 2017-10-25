FROM centos:7
MAINTAINER sysadmin@mimacom.com

ENV VERSION 8
ENV UID 1000

LABEL Description="CentOS 7 with Java JDK ${VERSION} (OpenJDK)"

RUN yum update -y && \
    rm -rf /var/cache/yum/* && \
    yum install -y java-1.8.0-openjdk-devel && \
    useradd --shell /bin/bash -u ${UID} --create-home -o -c "" -m user

# set JAVA_HOME
COPY java_openjdk.sh /etc/profile.d/java.sh


USER user
