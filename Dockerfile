FROM ubuntu:20.04
MAINTAINER cht.andy@gmail.com

RUN mv /bin/sh /bin/sh.old && ln -s /bin/bash /bin/sh 
RUN set -eux \
  && apt-get update && apt-get install --assume-yes bash-completion \
     sudo curl wget git cron \
  && rm -rf /var/lib/apt/lists/* && apt-get clean \
  && { \
     echo "#!/bin/bash"; \
     echo "test /etc/cron.d || mkdir -p /etc/cron.d"; \
     echo "chown -R root:root /etc/cron.d"; \
     echo "exec \"\$@\""; \
     } > /startup.sh \
  && chmod +x /startup.sh

ENTRYPOINT ["/startup.sh"]
CMD ["/usr/sbin/cron", "-f", "-L", "15"]
