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
WORKDIR /opt/
RUN wget http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/epp/downloads/release/neon/1a/eclipse-jee-neon-1a-linux-gtk-x86_64.tar.gz
RUN tar -zxf eclipse-jee-neon-1a-linux-gtk-x86_64.tar.gz
RUN rm eclipse-jee-neon-1a-linux-gtk-x86_64.tar.gz
#Configure vim
RUN touch ~/.vimrc
RUN echo "filetype plugin indent on" >> ~/.vimrc
#Configure Eclim
RUN git clone git://github.com/ervandew/eclim.git
ENV JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8
RUN sed -i.bak -e '30,40d' /opt/eclim/ant/build.gant
WORKDIR /opt/eclim/
RUN ant -Declipse.home=/opt/eclipse/
RUN ant vimdocs -Declipse.home=/opt/eclipse/
RUN sed -i.bak -e '18,22d' /opt/eclipse/eclimd
COPY startup.sh /opt/
RUN chmod +x /opt/startup.sh
RUN mkdir -p /home/Git_Projects
WORKDIR /home/Git_Projects/
RUN git clone https://github.com/HenriQA/KingMaze.git
ENTRYPOINT /opt/startup.sh
