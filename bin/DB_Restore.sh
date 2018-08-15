#!/bin/bash

if [ $# -lt 1 ]; then
    echo "$0 <xbstream-file> [to-dir]"
    exit 1
fi


db_file=$1
to_dir=${2:-"/DBrestore"}

test ! -d $to_dir/ && mkdir $to_dir/
rm -rf $to_dir/*


xbstream -x < $db_file -C $to_dir

cd $to_dir

for i in $(find -name "*.qp"); do qpress -vd $i $(dirname ${i}) && rm -f $i; done

xtrabackup --prepare --target-dir=.

