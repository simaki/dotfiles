#!bin/sh -eu

cd `dirname $0`

echo "--- cron setup start ---"

crontab cron.txt && crontab -l

echo "--- cron setup end ---"
