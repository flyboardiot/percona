FROM percona:5.7.22

RUN apt-get update && yes N | apt-get install -y \
  --no-install-suggests percona-xtrabackup-24 \
  && apt-get autoclean \
  && apt-get autoremove \
  && rm -rf /var/lib/apt/lists/*

ADD conf.d /etc/mysql/conf.d
