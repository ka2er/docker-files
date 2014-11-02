#!/bin/sh
# `chpst` is part of running. `chpst -u memcache` runs the given command
# as the user `memcache`. If you omit this, the command will be run as root.
/steward/steward/run.sh >>/var/log/the-thing-system.log 2>&1
