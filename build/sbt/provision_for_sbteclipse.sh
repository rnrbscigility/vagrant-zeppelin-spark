#!/bin/bash
################## process sbteclipse   ####################

mkdir -p ~/.sbt/0.13/plugins
cd ~/.sbt/0.13/plugins
touch plugins.sbt
echo 'addSbtPlugin("com.typesafe.sbteclipse" % "sbteclipse-plugin" % "4.0.0")' >> plugins.sbt

# ##################################################
# also install this as the vagrant user
# ##################################################

sudo -u vagrant mkdir -p /home/vagrant/.sbt/0.13/plugins
cd /home/vagrant/.sbt/0.13/plugins
sudo -u vagrant touch plugins.sbt
sudo -u vagrant echo 'addSbtPlugin("com.typesafe.sbteclipse" % "sbteclipse-plugin" % "4.0.0")' >> plugins.sbt
