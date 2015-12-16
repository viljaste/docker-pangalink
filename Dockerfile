FROM dockerizedrupal/supervisor-debian-jessie:1.1.0

MAINTAINER Jürgen Viljaste <j.viljaste@gmail.com>

ENV TERM xterm
ENV DEBIAN_FRONTEND noninteractive

ADD ./src /src

RUN /src/entrypoint.sh build

VOLUME ["/pangalink"]

EXPOSE 80
EXPOSE 443

CMD ["/src/entrypoint.sh", "run"]
