#!/bin/bash

# Determine the directory where this script is located
backup_dir="$(dirname "$(realpath "$0")")"

# Name of the backup file, based on the current date
mybackupname="$backup_dir/$(date +%Y-%m-%d-%H%M%S)-full-tar-backup.tar.gz"

# Record start time
start=$(date '+%s')

# List of exclusions
excludes=(
  --exclude="$mybackupname"
  --exclude=/proc
  --exclude=/lost+found
  --exclude=/sys
  --exclude=/mnt
  --exclude=/media
  --exclude=/dev
  --exclude=/run
  --exclude="$backup_dir"
  --exclude=/var/tmp
  --exclude=/tmp
  --exclude=/var/lib/docker/overlay2
)

# Function to convert file size to human-readable format
human_readable_size() {
  du -sh "$1" 2>/dev/null | cut -f1
}

# Function to convert seconds to human-readable format
human_readable_duration() {
  local duration=$1
  printf "%dm%02.0fs" $((duration / 60)) $((duration % 60))
}

# Log file path
logfile="./log_backup.log"
touch "$logfile"
chmod 664 "$logfile"

# Create the backup using tar, preserving file attributes
if ! tar --same-owner --preserve-permissions -czf "$mybackupname" "${excludes[@]}" / 2>/dev/null; then
  echo "$(date +"%Y-%m-%d %H:%M:%S") ERROR: tar failed" | tee -a "$logfile"
  exit 1
else
  size=$(human_readable_size "$mybackupname")
  duration=$(( $(date '+%s') - $start ))
  echo "$(date +"%Y-%m-%d %H:%M:%S") SUCCESS: Backup completed - File: $mybackupname | Size: $size | Duration: $(human_readable_duration "$duration")" | tee -a "$logfile"
fi

