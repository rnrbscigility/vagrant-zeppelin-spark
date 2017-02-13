#!/bin/bash
################## install scala   ####################

yum localinstall -y /resources/scala/scala-2.11.8.rpm

echo '' >> /etc/profile
echo '# set SCALA_HOME' >> /etc/profile
echo 'export SCALA_HOME=/usr/share/scala' >> /etc/profile
echo 'export PATH=$SCALA_HOME/bin:$PATH' >> /etc/profile
source /etc/profile
