#!/usr/bin/env bash
# Pi-hole: A black hole for Internet advertisements
# (c) 2015, 2016 by Jacob Salmela
# Network-wide ad blocking via your Raspberry Pi
# http://pi-hole.net
# Flushes /dev/shm/pihole.log
#
# Pi-hole is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.

# Check if stats.db exists in /var/lib/pihole
if [[ -f /var/lib/pihole/stats.db ]];then
    # Run sqlite to create the file
    sqlite3 /var/lib/pihole/stats.db < /usr/local/bin/setupPiholeStats.sql
fi

# Call lrs.php to get stats from pihole.log and write them to DB
php5 /var/www/html/admin/lrs.php

# Flush the log file
truncate -s 0 /dev/shm/pihole.log
