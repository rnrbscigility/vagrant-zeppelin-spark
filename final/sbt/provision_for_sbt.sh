#!/bin/bash
################## install sbt   ####################

# http://www.scala-sbt.org/download.html
# https://dl.bintray.com/sbt/native-packages/sbt/
# https://dl.bintray.com/sbt/native-packages/sbt/0.13.11/sbt-0.13.11.tgz
# https://dl.bintray.com/sbt/native-packages/sbt/0.13.12/sbt-0.13.12.tgz

tar -xvzf /resources/sbt/sbt-0.13.12.tgz -C /opt

echo '' >> /etc/profile
echo '# set SBT_HOME' >> /etc/profile
echo 'export SBT_HOME=/opt/sbt' >> /etc/profile
echo 'export PATH=$SBT_HOME/bin:$PATH' >> /etc/profile
source /etc/profile

# sbt

