FROM pataquets/ubuntu:trusty

RUN DEBIAN_FRONTEND=noninteractive \
	apt-get -y install python-setuptools && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

RUN easy_install supervisor

ADD ./etc/supervisor/ /etc/supervisor/

RUN mkdir -vp /etc/supervisor/conf.d
RUN mkdir -vp /var/log/supervisor
RUN mkdir -vp /var/run/supervisor

VOLUME /etc/supervisor/conf.d
VOLUME /var/run/supervisor/
VOLUME /var/log/supervisor/

EXPOSE 9001
