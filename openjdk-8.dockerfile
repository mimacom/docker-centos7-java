FROM mimacom/centos7
MAINTAINER sysadmin@mimacom.com

ENV VERSION 8

LABEL Description="CentOS 7 with Java JDK ${VERSION} (OpenJDK)"

RUN yum update -y && \
    rm -rf /var/cache/yum/* && \
    yum install -y java-1.8.0-openjdk-devel

# set JAVA_HOME
COPY java_openjdk.sh /etc/profile.d/java.sh
