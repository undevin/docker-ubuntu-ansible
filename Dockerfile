FROM ubuntu:18.04
RUN apt-get update && apt-get install -y locales && apt install -y software-properties-common && \
     rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

#Install pre and ansible
RUN apt-add-repository -y --update ppa:ansible/ansible \
    apt install -y ansible

#Setting up generic inventory file
RUN echo -e '[local]\nlocalhost ansible_connection=local' > /etc/ansible/hosts