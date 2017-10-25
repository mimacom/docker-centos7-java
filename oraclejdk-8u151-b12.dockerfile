FROM centos:7
MAINTAINER sysadmin@mimacom.com

ENV VERSION 8
ENV UPDATE 151
ENV BUILD 12
ENV SIG e758a0de34e24606bca991d704f6dcbf

LABEL Description="CentOS 7 with Java JDK ${VERSION} from oracle"

# download java
RUN yum update -y && \
    rm -rf /var/cache/yum/* && \
    yum install -y wget && \
    mkdir -p /opt/java && \
    wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/"${VERSION}"u"${UPDATE}"-b"${BUILD}"/"${SIG}"/jdk-"${VERSION}"u"${UPDATE}"-linux-x64.tar.gz -O /opt/jdk.tar.gz && \
    tar xfv /opt/jdk.tar.gz -C /opt/java/ --strip-components=1 && \
    rm -f /opt/jdk.tar.gz

# add java to PATH
COPY java_oraclejdk.sh /etc/profile.d/java.sh
