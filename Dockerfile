FROM jenkins/jnlp-slave:3.29-1
MAINTAINER EricoGR <ericogr@gmail.com>
LABEL Description="Jenkins agent with ansible"

USER root

RUN apt-get update
RUN apt-get install -y python3-pip

RUN pip3 install ansible

USER jenkins
