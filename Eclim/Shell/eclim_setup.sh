#!/bin/bash

apt-get -y update
apt-get -y upgrade
apt-get install -y \
wget \
openjdk-8-jdk \
xvfb \
build-essential \
vim \
git \
gcc \
make \
ant \
gant \
python \
python-pip

pip install -U Sphinx
cd /opt/
wget http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/epp/downloads/release/neon/1a/eclipse-jee-neon-1a-linux-gtk-x86_64.tar.gz
tar -zxf eclipse-jee-neon-1a-linux-gtk-x86_64.tar.gz
rm eclipse-jee-neon-1a-linux-gtk-x86_64.tar.gz
#Configure vim
touch ~/.vimrc
echo "filetype plugin indent on" >> ~/.vimrc
#Configure Eclim
git clone git://github.com/ervandew/eclim.git
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8
sed -i.bak -e '30,40d' /opt/eclim/ant/build.gant
/opt/eclim/
ant -Declipse.home=/opt/eclipse/
ant vimdocs -Declipse.home=/opt/eclipse/
sed -i.bak -e '18,22d' /opt/eclipse/eclimd
#Set eclipse to run headless
unset JAVA_TOOL_OPTIONS
Xvfb :1 -screen 0 1024x768x24 &
DISPLAY=:1 /opt/eclipse/eclipse -clean -nosplash -consolelog -debug -application org.eclipse.equinox.p2.director -repository http://download.eclipse.org/releases/juno -installIU org.eclipse.wst.web_ui.feature.feature.group
DISPLAY=:1 /opt/eclipse/eclimd
