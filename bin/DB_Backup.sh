#!/bin/bash

#if [ $# -lt 1 ]; then
#    echo "$0 <target-dir> <user> <password> "
#    exit 1
#fi


db_user=${2:-"root"}
db_passwd=${3:-$MYSQL_ROOT_PASSWORD}

db_dir=${1:-"/DBbackup"}
db_Date=`date "+%Y-%m-%d_%H-%M-%S"`

backup_file="$db_dir/$db_Date.xbstream"


test ! -d "$db_dir/" && mkdir "$db_dir/" 

xtrabackup --defaults-file=/etc/mysql/my.cnf --user=$db_user --password=$db_passwd --compress --parallel=2 --compress-threads=2 --stream=xbstream --backup --target-dir=$db_dir > $backup_file

