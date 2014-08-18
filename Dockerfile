FROM pataquets/ubuntu-base

RUN DEBIAN_FRONTEND=noninteractive \
	apt-get -y install python-setuptools && \
	apt-get clean

RUN easy_install supervisor

ADD ./etc/supervisor/ /etc/supervisor/

RUN mkdir -vp /var/log/supervisor
RUN mkdir -vp /var/run/supervisor

VOLUME /var/run/supervisor/
VOLUME /var/log/supervisor/

EXPOSE 9001
