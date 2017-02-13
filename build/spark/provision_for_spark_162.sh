#!/bin/bash
################## install spark 1.6.2   ####################

mkdir -p /opt/spark-1.6.2
cd /resources/spark/
tar -xvzf spark-1.6.2-bin-hadoop2.6.tgz -C /opt/spark-1.6.2

cd /opt/spark-1.6.2
ln -s spark-1.6.2-bin-hadoop2.6 spark

echo '' >> /etc/profile
echo '# set SPARK_HOME' >> /etc/profile
echo 'export SPARK_HOME=/opt/spark-1.6.2/spark' >> /etc/profile
echo 'export PATH=$SPARK_HOME/bin:$PATH' >> /etc/profile
source /etc/profile
