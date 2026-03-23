FROM ubuntu:22.04

RUN apt update && apt install -y openssh-server sudo

RUN useradd -m ansible

RUN echo "ansible:ansible" | chpasswd

RUN usermod -aG sudo ansible

RUN echo "ansible ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN mkdir /var/run/sshd

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
