#!/bin/bash

# Program Title
echo "============================================"
echo "          Linux Tar Restore Guide          "
echo "============================================"
echo ""
echo "This program provides guidance on how to restore files, directories,"
echo "or the entire system from a compressed tar backup file."
echo ""
echo "Select an option to see the corresponding Linux CLI restore command:"
echo ""

# Display Menu
while true; do
    echo "1) Restore a specific file from full_tar_backup.tar.gz"
    echo "2) Restore an entire directory from full_tar_backup.tar.gz"
    echo "3) Restore the entire backup to the ./restore directory"
    echo "4) Restore the full backup to the root directory (⚠ USE WITH CAUTION ⚠)"
    echo "5) Exit"
    echo ""
    read -rp "Enter your choice (1-5): " choice

    case $choice in
        1)
            echo ""
            echo "🔹 To restore a specific file from full_tar_backup.tar.gz into the ./restore directory:"
            echo ""
            echo "   sudo tar --same-owner --preserve-permissions -xzvf full_tar_backup.tar.gz -C ./restore path/to/file"
            echo ""
            echo "Replace 'path/to/file' with the actual file path inside the backup."
            echo "Example: sudo tar --same-owner --preserve-permissions -xzvf full_tar_backup.tar.gz -C ./restore home/user/document.txt"
            echo ""
            ;;
        2)
            echo ""
            echo "🔹 To restore an entire directory from full_tar_backup.tar.gz into the ./restore directory:"
            echo ""
            echo "   sudo tar --same-owner --preserve-permissions -xzvf full_tar_backup.tar.gz -C ./restore path/to/directory"
            echo ""
            echo "Replace 'path/to/directory' with the actual directory inside the backup."
            echo "Example: sudo tar --same-owner --preserve-permissions -xzvf full_tar_backup.tar.gz -C ./restore var/www"
            echo ""
            ;;
        3)
            echo ""
            echo "🔹 To restore everything from full_tar_backup.tar.gz into the ./restore directory:"
            echo ""
            echo "   sudo tar --same-owner --preserve-permissions -xzvf full_tar_backup.tar.gz -C ./restore"
            echo ""
            echo "This will extract all files into the ./restore directory in your current working directory."
            echo ""
            ;;
        4)
            echo ""
            echo "⚠ WARNING: THIS ACTION WILL OVERWRITE YOUR ENTIRE FILE SYSTEM! ⚠"
            echo "⚠ Proceed only if you are sure you want to restore the entire backup. ⚠"
            echo ""
            echo "🔹 To restore the full backup directly to the root directory:"
            echo ""
            echo "   sudo tar --same-owner --preserve-permissions -xzvf full_tar_backup.tar.gz -C /"
            echo ""
            echo "This will extract and overwrite all files at the topmost level (root /)."
            echo "Ensure you have a valid and complete backup before running this command!"
            echo ""
            ;;
        5)
            echo "Exiting the program. Stay safe!"
            exit 0
            ;;
        *)
            echo "Invalid option. Please select a valid choice (1-5)."
            ;;
    esac
done

