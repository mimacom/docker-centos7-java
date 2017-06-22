FROM centos:7
MAINTAINER sysadmin@mimacom.com

ENV VERSION 8
ENV UPDATE 131
ENV BUILD 11
ENV SIG d54c1d3a095b4ff2b6607d096fa80163

LABEL Description="CentOS 7 with Java JDK ${VERSION} from oracle"

# download java
RUN yum update -y && \
    rm -rf /var/cache/yum/* && \
    yum install -y wget && \
    mkdir -p /opt/java && \
    wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/"${VERSION}"u"${UPDATE}"-b"${BUILD}"/"${SIG}"/jre-"${VERSION}"u"${UPDATE}"-linux-x64.tar.gz -O /opt/jre.tar.gz && \
    tar xfv /opt/jre.tar.gz -C /opt/java/ --strip-components=1 && \
    rm -f /opt/jre.tar.gz

# add java to PATH
COPY java.sh /etc/profile.d/java.sh

#WORKDIR /
#ENTRYPOINT ["true"]
