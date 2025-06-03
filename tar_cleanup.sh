#!/bin/bash

# Log file path
logfile="/home/<username>/backups/log_cleanup.log"
touch "$logfile"
chmod 664 "$logfile"

# Log the start of the cleanup
echo "$(date +"%Y-%m-%d %H:%M:%S") Cleanup started" >> "$logfile"

# Find and remove backups created more than 3 days ago, log number of deleted files
deleted_files=$(sudo find ./ -type f -name "*.tar.gz" -exec stat -c "%W %n" {} \; | awk '$1 != 0 && (systime() - $1) > 242200 {print $2}' | xargs -I {} sudo rm -rfv {} | tee -a "$logfile" | wc -l)

# Log cleanup completion with the number of deleted files
echo "$(date +"%Y-%m-%d %H:%M:%S") Cleanup completed = $deleted_files files deleted" >> "$logfile"
