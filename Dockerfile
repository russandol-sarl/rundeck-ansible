FROM rundeck/rundeck:3.4.8

MAINTAINER oredin <frederic.caillet@russandol.eu>

ENV ANSIBLE_HOST_KEY_CHECKING=false
ENV RDECK_BASE=/home/rundeck
ENV MANPATH=${MANPATH}:${RDECK_BASE}/docs/man
ENV PATH=${PATH}:${RDECK_BASE}/tools/bin

RUN sudo apt-get -y update \
  && sudo apt-get -y --no-install-recommends install ca-certificates python3-pip sshpass \
  && sudo -H pip3 --no-cache-dir install --upgrade pip setuptools \
  && sudo -H pip3 --no-cache-dir install ansible==5.0.1 \
  && sudo rm -rf /var/lib/apt/lists/* \
  && sudo mkdir /etc/ansible
