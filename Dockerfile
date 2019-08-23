FROM jenkins/slave:3.29-2
MAINTAINER EricoGR <ericogr@gmail.com>
LABEL Description="Jenkins agent with ansible"

USER root

RUN apt-get update
RUN apt-get install -y python3-pip
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python get-pip.py --user
RUN pip3 install --user ansible

USER ${user}

COPY jenkins-slave /usr/local/bin/jenkins-slave

ENTRYPOINT ["jenkins-slave"]
