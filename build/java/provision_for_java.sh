#!/bin/bash
################## install oracle jdk1.8   ####################

# Download from http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html

yum localinstall -y /resources/java/jdk-8u121-linux-x64.rpm
VERSION=$(rpm -qp --queryformat "%{VERSION}\n" /resources/java/jdk-8u121-linux-x64.rpm)

# configure it on the system using the alternatives command. This is in order to tell the system what are the default commands for JAVA
alternatives --install /usr/bin/java java /usr/java/jdk${VERSION}/jre/bin/java 20000
alternatives --install /usr/bin/javac javac /usr/java/jdk${VERSION}/bin/javac 20000
alternatives --set java /usr/java/jdk${VERSION}/jre/bin/java
alternatives --set javac /usr/java/jdk${VERSION}/bin/javac


echo '' >> /etc/profile
echo '# set JAVA_HOME' >> /etc/profile
echo 'export JAVA_HOME=/usr/java/default' >> /etc/profile
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> /etc/profile
source /etc/profile

java -version
javac -version
