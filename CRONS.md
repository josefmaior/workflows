```bash
# Edit this file to introduce tasks to be run by cron.
#
# Each task to run has to be defined through a single line
# indicating with different fields when the task will be run
# and what command to run for the task
#
# To define the time you can provide concrete values for
# minute (m), hour (h), day of month (dom), month (mon),
# and day of week (dow) or use '*' in these fields (for 'any').#
# Notice that tasks will be started based on the cron's system
# daemon's notion of time and timezones.
#
# Output of the crontab jobs (including errors) is sent through
# email to the user the crontab file belongs to (unless redirected).
#
# For example, you can run a backup of all your user accounts
# at 5 a.m every week with:
# 0 5 * * 1 tar -zcf /var/backups/home.tgz /home/
#
# For more information see the manual pages of crontab(5) and cron(8)
#
# m h  dom mon dow   command


# backup-respondent-db/run
# /workflows/backup-respondent-db/run Backups AuraDB
55 23 * * SUN cronitor exec XXXXXX "/usr/bin/env bash -c 'sh /root/workflows/backup-respondent-db/run >> /root/logs/backup-respondent-db/run_log_`date +%Y-%m-%d`.log' 2>&1"

# irozhlas-analysis/run_scrape
0 * * * * cronitor exec XXXXXX "/usr/bin/env bash -c 'sh /root/workflows/analyze-irozhlas/run_scrape' > /dev/null 2>&1"
# irozhlas-analysis/run (Geneea analysis of Irozhlas data)
45 23 * * * cronitor exec XXXXXX "/usr/bin/env bash -c 'sh /root/workflows/analyze-irozhlas/run' > /dev/null 2>&1"

# process-openmedia-data/run
0 1 * * MON cronitor exec XXXXXX "/usr/bin/env bash -c 'sh /root/workflows/process-openmedia-data/run' > /dev/null 2>&1"

```
