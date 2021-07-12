FROM ubuntu:20.04
MAINTAINER cht.andy@gmail.com

RUN mv /bin/sh /bin/sh.old && ln -s /bin/bash /bin/sh 

RUN set -eux \
  && apt-get update && apt-get install --assume-yes bash-completion \
     sudo curl wget git cron \
  && rm -rf /var/lib/apt/lists/* && apt-get clean

# start crond with log level 8 in foreground, output to stderr
CMD ["/usr/sbin/cron", "-f", "-L", "15"]
