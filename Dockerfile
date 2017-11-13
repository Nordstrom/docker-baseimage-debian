FROM bitnami/minideb:stretch
MAINTAINER Nordstrom Kubernetes Platform Team "techk8s@nordstrom.com"

RUN apt-get update -qy

RUN apt-get install -qyf \
  apt-transport-https \
  ca-certificates \
  curl

COPY nordstrom-ca-certs/ /etc/ssl/nordstrom-ca-certs/

RUN useradd --create-home --shell /bin/bash nordstrom
USER nordstrom
WORKDIR /

CMD ["/bin/bash"]
