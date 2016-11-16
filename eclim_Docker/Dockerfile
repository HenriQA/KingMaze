FROM ubuntu
MAINTAINER Henri

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y \
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

RUN pip install -U Sphinx
WORKDIR /home
RUN wget http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/epp/downloads/release/neon/1a/eclipse-jee-neon-1a-linux-gtk-x86_64.tar.gz
RUN tar -zxf eclipse-jee-neon-1a-linux-gtk-x86_64.tar.gz
RUN rm eclipse-jee-neon-1a-linux-gtk-x86_64.tar.gz
#Configure vim
RUN touch ~/.vimrc
RUN echo "filetype plugin indent on" >> ~/.vimrc
#Configure Eclim
RUN git clone git://github.com/ervandew/eclim.git
ENV JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8
RUN sed -i.bak -e '30,40d' /home/eclim/ant/build.gant
WORKDIR /home/eclim/
RUN ant -Declipse.home=/home/eclipse/
RUN ant vimdocs -Declipse.home=/home/eclipse/
RUN sed -i.bak -e '18,22d' /home/eclipse/eclimd
COPY startup.sh /home/
RUN chmod +x /home/startup.sh
WORKDIR /home/
ENTRYPOINT /home/startup.sh
ry http://download.eclipse.org/releases/juno -installIU org.eclipse.wst.web_ui.feature.feature.group && DISPLAY=:1 /home/eclipse/eclimd

