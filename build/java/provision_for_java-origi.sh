#!/bin/bash
################## install oracle jdk1.8   ####################

yum localinstall -y /resources/oracle-java-sdk-jdk/jdk-8u101-linux-x64.rpm

# configure it on the system using the alternatives command. This is in order to tell the system what are the default commands for JAVA
alternatives --install /usr/bin/java java /usr/java/jdk1.8.0_101/jre/bin/java 20000
alternatives --install /usr/bin/javac javac /usr/java/jdk1.8.0_101/bin/javac 20000
alternatives --set java /usr/java/jdk1.8.0_101/jre/bin/java
alternatives --set javac /usr/java/jdk1.8.0_101/bin/javac

# list version
ls -lA /etc/alternatives/ | grep java
java -version
javac -version

echo '' >> /etc/profile
echo '# set JAVAHOME' >> /etc/profile
echo 'export JAVA_HOME=/usr/java/jdk1.8.0_101' >> /etc/profile
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> /etc/profile
source /etc/profile
