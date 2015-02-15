#!/bin/sh
dir=/opt/shmup_sql_backup
filename=`date "+%Y_%m_%d"`
mysqldump -uroot -pm1710calos --opt shmup > $dir/$filename.sql
cd $dir
tar -zcvf $filename.tar.gz $filename.sql
rm $filename.sql
