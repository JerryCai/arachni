FROM ubuntu:14.04

MAINTAINER Jerry Cai

ARG ARACHNI_VERSION=arachni-1.5.1-0.5.12
ENV SERVER_ROOT_PASSWORD arachni
ENV ARACHNI_PARAMS --authentication-username arachni --authentication-password password --only-positives

RUN apt-get update

RUN apt-get -y install \
                openssh-server \
                wget \
                curl \
                supervisor

RUN mkdir /var/run/sshd && \
    mkdir -p /var/log/supervisor && \
    mkdir -p /etc/supervisor/conf.d

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN wget https://github.com/Arachni/arachni/releases/download/v1.5.1/${ARACHNI_VERSION}-linux-x86_64.tar.gz && \
    tar xzvf ${ARACHNI_VERSION}-linux-x86_64.tar.gz && \
    mv ${ARACHNI_VERSION} /usr/local

#COPY "$PWD"/${ARACHNI_VERSION}-linux-x86_64.tar.gz /usr/local/${ARACHNI_VERSION}-linux-x86_64.tar.gz
#RUN cd /usr/local && tar xzvf ${ARACHNI_VERSION}-linux-x86_64.tar.gz

RUN ln -sf /usr/local/${ARACHNI_VERSION} /usr/local/arachni

COPY "$PWD"/chpasswd.sh /usr/local/chpasswd.sh
RUN chmod 777 /usr/local/chpasswd.sh

COPY "$PWD"/start.sh /usr/local/arachni/start.sh
RUN chmod 777 /usr/local/arachni/start.sh

ADD supervisor.conf /etc/supervisor.conf
ADD arachni.conf /etc/supervisor/conf.d/arachni.conf

EXPOSE 22 7331 9292
CMD ["supervisord", "-c", "/etc/supervisor.conf"]
