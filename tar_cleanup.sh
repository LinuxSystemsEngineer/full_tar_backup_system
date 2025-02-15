#!/bin/bash

# Log file path
logfile="./log_cleanup.log"
touch "$logfile"
chmod 664 "$logfile"

# Log the start of the cleanup
echo "$(date +"%Y-%m-%d %H:%M:%S") Cleanup started" >> "$logfile"

# Find and remove backups older than 3 days, log number of deleted files
deleted_files=$(sudo find ./ -type f -mtime +3 -name '*-full-tar-backup.tar.gz' -exec rm -rfv {} \; | tee -a "$logfile" | wc -l)

# Log cleanup completion with the number of deleted files
echo "$(date +"%Y-%m-%d %H:%M:%S") Cleanup completed - $deleted_files files deleted" >> "$logfile"

