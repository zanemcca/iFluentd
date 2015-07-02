FROM ruby:2.2.0
MAINTAINER zane@instanews.com 
RUN apt-get update
RUN gem install fluentd -v "~>0.12.3"
RUN mkdir /etc/fluent
RUN apt-get install -y libcurl4-gnutls-dev make
RUN /usr/local/bin/gem install fluent-plugin-elasticsearch
ADD fluent.conf /etc/fluent/
ENTRYPOINT ["/usr/local/bundle/bin/fluentd", "-c", "/etc/fluent/fluent.conf"]

