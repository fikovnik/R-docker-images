FROM ubuntu:16.10
ARG R_CC
ARG R_CFLAGS
MAINTAINER Filip Krikava "krikava@gmail.com"

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update -yqq && \
    apt-get install -yqq \
      curl \
      less \
      vim-tiny \
      git \
      autoconf \
      libtool \
      make \
      gcc \
      gfortran \
      clang \
      libreadline-dev \
      libz-dev \
      libbz2-dev \
      liblzma-dev \
      libpcre3-dev \
      libcurl4-openssl-dev

ENV R_VERSION 3.3.1
ENV R_URL https://cloud.r-project.org/src/base/R-3/R-3.3.1.tar.gz
ENV R_SRC_DIR /R
ENV R_CONFIGURATION_FILE "/$R_SRC_DIR/configuration"

RUN mkdir -p "$R_SRC_DIR" && \
        mkdir data

WORKDIR "$R_SRC_DIR"
CMD ["R"]
VOLUME /data

RUN echo "$R_CC"
RUN curl "$R_URL" | tar xz --strip-components=1 -C "$R_SRC_DIR"
RUN cd "$R_SRC_DIR" && \
      CC="$R_CC" CFLAGS="$R_CFLAGS" ./configure --without-recommended-packages --disable-java --without-aqua --without-x --without-tcltk && \
      cat config.log | sed '/R is now configured/,$!d' | sed '/Recommended packages/q' > "$R_CONFIGURATION_FILE" && \
      cat "$R_CONFIGURATION_FILE" && \
      make && \
      make install
