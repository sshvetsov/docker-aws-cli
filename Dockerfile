FROM ubuntu:trusty
MAINTAINER Sergei Shvetsov <sshvetsov@gmail.com>

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install --yes --no-install-recommends \
  python-pip \
  groff \
  && DEBIAN_FRONTEND=noninteractive apt-get clean \
  && DEBIAN_FRONTEND=noninteractive rm -rf /var/lib/apt/lists/*

RUN \
  pip install awscli

RUN useradd aws

RUN mkdir /data \
  && chown aws:aws /data

VOLUME /data

USER aws
ENTRYPOINT ["aws"]
CMD ["help"]
