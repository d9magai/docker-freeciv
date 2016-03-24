FROM centos
MAINTAINER d9magai

ENV FREECIV_MAJOR_VERSION 2
ENV FREECIV_MINOR_VERSION 5
ENV FREECIV_TEENY_VERSION 3
ENV FREECIV_VERSION ${FREECIV_MAJOR_VERSION}.${FREECIV_MINOR_VERSION}.${FREECIV_TEENY_VERSION}
ENV FREECIV_BASENAME freeciv-${FREECIV_VERSION}
ENV FREECIV_ARCHIVE_URL http://jaist.dl.sourceforge.net/project/freeciv/Freeciv%20${FREECIV_MAJOR_VERSION}.${FREECIV_MINOR_VERSION}/${FREECIV_VERSION}/${FREECIV_BASENAME}.tar.bz2
ENV FREECIV_AUTH_FILENAME fc_auth.conf

RUN yum update -y \
    && yum install -y epel-release \
    && yum install -y \
    sudo \
    bzip2 \
    gcc-c++ \
    make \
    libcurl-devel \
    zlib-devel \
    gtk3-devel \
    ImageMagick-devel \
    mariadb-devel \
    && yum clean all

RUN curl -sL ${FREECIV_ARCHIVE_URL} | tar xj \
    && cd ${FREECIV_BASENAME} \
    && ./configure --enable-client=no --enable-fcdb=mysql \
    && make -s \
    && make -s install \
    && rm -rf ../${FREECIV_BASENAME}

RUN adduser freeciv -M

CMD sudo -u freeciv /usr/local/bin/freeciv-server --auth --Database /srv/${FREECIV_AUTH_FILENAME}

