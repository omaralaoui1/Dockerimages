FROM jenkins/agent:latest
USER root
# Install required dependencies for jenkins slave launch
RUN apt-get update && apt-get install -y python3 python3-pip

# Install common binaries to support some generic functionality without an docker image
RUN apt-get update && apt-get install -y git make curl wget

# Install Python-docker
#RUN apt-get update && apt -y install python-docker
RUN pip3 install docker-py
# Install Docker
RUN wget -O get-docker.sh https://get.docker.com/ && sh get-docker.sh
# Install Ansible
#RUN apt -y install software-properties-common \
 #&& add-apt-repository --yes --update ppa:ansible/ansible \
 RUN  apt -y install ansible
# Install docker-compose
RUN curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr>RUN chmod +x /usr/local/bin/docker-compose
CMD ["bash"]
