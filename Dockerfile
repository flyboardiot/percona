FROM percona:5.7.22

RUN apt-get update && yes N | apt-get install -y \
  --no-install-suggests percona-xtrabackup-24 \
  qpress \
  && apt-get autoclean \
  && apt-get autoremove \
  && rm -rf /var/lib/apt/lists/*

ADD conf.d /etc/mysql/conf.d
ADD bin /bin
RUN chmod a+x /bin/DB_Backup.sh /bin/DB_Restore.sh
