FROM ubuntu:16.04
MAINTAINER Sung-Jae Lee "sjlee@mail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y wkhtmltopdf python python-pip xvfb
RUN pip install grip

ADD convert.sh /usr/local/bin/convert

WORKDIR /doc

ENTRYPOINT ["/usr/local/bin/convert"]
