#!/bin/bash
################## install maven   ####################

mkdir -p /opt/maven
cd /opt/maven
\cp -uf /resources/maven/apache-maven-3.3.9-bin.tar.gz .
tar -xvzf apache-maven-3.3.9-bin.tar.gz -C /opt/maven

alternatives --install /usr/bin/mvn mvn /opt/maven/apache-maven-3.3.9/bin/mvn 20000
alternatives --set mvn /opt/maven/apache-maven-3.3.9/bin/mvn

# list version
ls -lA /etc/alternatives/ | grep mvn

mvn -version

echo '' >> /etc/profile
echo '# set MAVEN_HOME' >> /etc/profile
echo 'export MAVEN_HOME=/opt/maven/apache-maven-3.3.9' >> /etc/profile
echo 'export PATH=$MAVEN_HOME/bin:$PATH' >> /etc/profile
source /etc/profile

