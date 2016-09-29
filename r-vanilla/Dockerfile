FROM ubuntu:16.04
MAINTAINER Filip Krikava "krikava@gmail.com"

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update -yqq && \
    apt-get install -yqq \
    gnupg \
    dirmngr \
    curl \
    less \
    vim-tiny \
    git


RUN echo "deb http://cran.rstudio.com/bin/linux/ubuntu xenial/" >> /etc/apt/sources.list
RUN gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
RUN gpg -a --export E084DAB9 | apt-key add -

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update -yqq && \
    apt-get install -yqq \
      r-base \
      r-base-dev

CMD ["R"]
VOLUME /data
