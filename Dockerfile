FROM centos:7 as builder

RUN     yum install -y make cmake gcc gcc++ git wget

FROM builder as builder-pure-ftpd

ENV VERSION=pure-ftpd-1.0.49

WORKDIR /opt
RUN  wget https://download.pureftpd.org/pub/pure-ftpd/releases/${VERSION}.tar.gz && \
        tar zxvf ${VERSION}.tar.gz

WORKDIR /opt/${VERSION}

RUN    ./configure \
	--prefix=/opt/purefptd \
	--with-everything && \
        make && make install


FROM centos:7
ENV PUBLIC_HOST=localhost

COPY --from=builder-pure-ftpd /opt/purefptd /opt/purefptd
ADD ./entrypoint.sh /usr/bin/entrypoint.sh
ADD ./start.sh /usr/bin/start.sh
WORKDIR /opt/purefptd

VOLUME /opt/purefptd/etc/ /home/ftpuser

EXPOSE 21 30000-30009

ENTRYPOINT ["/usr/bin/entrypoint.sh"]

CMD ["start.sh"]

