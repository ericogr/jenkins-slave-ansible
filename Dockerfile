FROM jenkins/slave:3.29-1
MAINTAINER EricoGR <ericogr@gmail.com>
LABEL Description="This is a base image, which provides the Jenkins agent executable (slave.jar) with ansible"

USER root

# RUN echo 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main' > /etc/apt/sources.list
# RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 93C4A3FD7BB9C367
# RUN apt-get update
# RUN apt-get install ansible

RUN apt-get update
RUN apt-get install -y python3-pip
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python get-pip.py --user
RUN pip3 install --user ansible

USER ${user}

ENV PATH "$PATH:/home/jenkins/.local/bin"
RUN ansible --version
