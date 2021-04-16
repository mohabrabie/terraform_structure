FROM ubuntu
USER root
RUN mkdir -p jenkins_home
RUN chmod 777 jenkins_home
RUN apt-get update -qq \
    && apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common 
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN apt-get update  -qq \
    && apt-get install docker-ce -y
RUN useradd jenkins -d /home/jenkins
RUN usermod -aG docker jenkins
RUN apt install git
RUN apt-get install openjdk-8-jdk -qq
RUN apt-get install openssh-server -qq
USER jenkins
WORKDIR jenkins_home
RUN ls /home
COPY key.pub ~/.ssh/authorized_keys
CMD ["/bin/bash"]

