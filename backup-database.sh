#!/bin/sh
dir=/opt/fluxx_sql_backup
filename=`date "+%Y_%m_%d"`
mysqldump -uroot -pm1710calos --opt fluxx > $dir/$filename.sql
cd $dir
tar -zcvf $filename.tar.gz $filename.sql
rm $filename.sql

dir=/opt/ngdb_sql_backup
filename=`date "+%Y_%m_%d"`
mysqldump -uroot -pm1710calos --opt ngdb > $dir/$filename.sql
cd $dir
tar -zcvf $filename.tar.gz $filename.sql
rm $filename.sql

