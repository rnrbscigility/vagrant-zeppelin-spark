#!/bin/bash
################## setup sample scala app   ####################

mkdir -p /opt/scala_demo/src/main/scala
mkdir -p /opt/scala_demo/src/main/resources

cd /opt/scala_demo
cp /vagrant/sbt-demo/build.sbt .

## ###########################################

cd /opt/scala_demo/src/main/scala
cp /vagrant/sbt-demo/WordCount.scala .

## ###########################################

cd /opt/scala_demo/src/main/resources
cp /vagrant/sbt-demo/application.properties .

## ###########################################

# chown -R vagrant:vagrant /opt/scala_demo
cd /opt/scala_demo

## ###########################################

sbt package
sbt eclipse

# sudo -u root /opt/sbt/bin/sbt package
# sudo -u root /opt/sbt/bin/sbt eclipse
# sudo -u root chown -R vagrant:vagrant /opt/scala_demo
