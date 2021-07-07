#!bin/sh -eu

cd `dirname $0`
crontab cron.txt && crontab -l
