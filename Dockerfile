FROM ubuntu:14.04
MAINTAINER david.siaw@mobingi.com

RUN \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
        apt-get -y install \
            mysql-proxy supervisor ruby \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/

RUN mkdir -p /var/log/supervisor

EXPOSE 3306
EXPOSE 4041

ADD run.sh /run.sh
RUN chmod 755 /*.sh

ENV ADMIN_ADDRESS 0.0.0.0:4041
ENV PROXY_ADDRESS 0.0.0.0:4041
ENV MASTER_ADDRESSES 192.168.0.11:3306
ENV SLAVE_ADDRESSES 192.168.0.12:3306,192.168.0.13:3306

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY default-mysql-proxy /etc/default/mysql-proxy
COPY mysql-proxy.conf /etc/mysql-proxy.conf

CMD [ "/run.sh" ]
