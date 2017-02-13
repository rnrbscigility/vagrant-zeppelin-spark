#!/bin/bash
################## install spark 2.0.1   ####################

mkdir -p /opt/spark-2.0.1
cd /resources/spark/
tar -xvzf spark-2.0.1-bin-hadoop2.6.tgz -C /opt/spark-2.0.1

cd /opt/spark-2.0.1
ln -s spark-2.0.1-bin-hadoop2.6 spark

echo '' >> /etc/profile
echo '# set SPARK_HOME' >> /etc/profile
echo 'export SPARK_HOME=/opt/spark-2.0.1/spark' >> /etc/profile
echo 'export PATH=$SPARK_HOME/bin:$PATH' >> /etc/profile
source /etc/profile
