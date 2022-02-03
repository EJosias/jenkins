FROM ubuntu

WORKDIR /workspace

RUN apt-get update 
RUN apt-get install -y wget gnupg
RUN wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | apt-key add -
RUN sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y default-jre jenkins
RUN apt-get install -y python3 python3-pip python3.8-venv python3-dev

RUN ln -sf /usr/bin/python3 /usr/bin/python
RUN ln -sf /usr/bin/pip3 /usr/bin/pip

#RUN /etc/init.d/jenkins start