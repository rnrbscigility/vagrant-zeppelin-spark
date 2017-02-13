#!/bin/bash
################## install spark 1.6.2   ####################

mkdir -p /opt/zeppelin
cd /resources/zeppelin/
tar -xvzf zeppelin-0.7.0-bin-all.tgz -C /opt/zeppelin --strip-components=1

cd /opt/zeppelin

cp conf/zeppelin-env.sh.template conf/zeppelin-env.sh
sed -i '/^# export SPARK_HOME/ a export SPARK_HOME=/opt/spark-1.6.2/spark' conf/zeppelin-env.sh
sed -i '/^# export JAVA_HOME/ a export JAVA_HOME=/usr/java/default' conf/zeppelin-env.sh

cp conf/zeppelin-site.xml.template conf/zeppelin-site.xml
sed -i 's,<value>8080</value>,<value>9995</value>,' conf/zeppelin-site.xml