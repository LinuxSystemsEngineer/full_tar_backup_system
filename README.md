# 🔹 FULL TAR BACKUP 🔹

## Overview
FULL TAR BACKUP is a simple and effective Bash script solution for **creating, managing, and restoring full system backups** using `tar` and `gzip`. These scripts allow Linux users to **efficiently back up and restore their systems** while preserving file ownership, groups, and permissions.

---

## 🚀 Functions
- **Automated full system backups** (`tar_backup.sh`)
- **Automated cleanup of old backups** (`tar_cleanup.sh`)
- **Interactive restore guide** (`tar_restore.sh`)
- **Preserves file permissions, ownership, and groups**
- **Uses only built-in Linux tools (`tar`, `gzip`)**
- **Safe and easy-to-use CLI interface**

---

## 📂 File Structure
| File               | Description |
|--------------------|-------------|
| `tar_backup.sh`   | Creates a full system backup and saves it as a `.tar.gz` file. |
| `tar_cleanup.sh`  | Deletes old backups older than **3 days** to free up space. |
| `tar_restore.sh`  | Interactive guide to restore files, directories, or the full system. |

---

## 🔧 **Installation & Setup**
1. Clone this repository:

  ```bash
   git clone https://github.com/YOUR_GITHUB_USERNAME/full-tar-backup.git
```

2. Change directories into the newly cloned repo

  ```bash
   cd full-tar-backup
```

4.  Grant execution permissions to all scripts:
    
   ```bash
chmod +x tar_backup.sh tar_cleanup.sh tar_restore.sh
```
    

----------

## 🔄 **Usage Guide**

Each script should be run using **sudo** to ensure proper permissions are preserved.

### 🛠 **1. Running the Backup Script**

To **create a full system backup**, run:


   ```bash
sudo ./tar_backup.sh
```

-   This will generate a `full-tar-backup.tar.gz` file in the current directory.
-   The script **excludes** unnecessary system paths (`/proc`, `/dev`, `/sys`, etc.).
-   It **preserves file ownership, groups, and permissions**.

----------

### 🧹 **2. Cleaning Up Old Backups**

To **delete backups older than 3 days**, run:


   ```bash
sudo ./tar_cleanup.sh
```

-   This script automatically finds and **removes old `.tar.gz` backups**, helping you save disk space.

----------

### 🔄 **3. Restoring Files from Backup**

Run the interactive restore guide:


   ```bash
sudo ./tar_restore.sh
```

You will see a menu explaining **how to restore different types of backups**.

----------

## ✅ **Best Practices**

-   **Store backups on an external disk or cloud storage** to avoid data loss.
-   **Verify backups before restoring**:
    
   ```bash
tar -tzf full-tar-backup.tar.gz
```
    
-   **Test restoration on a test system** before production environments.

----------

## 🛠 **Troubleshooting**


   ```bash
tar: Cannot open: Permission denied
```

Use `sudo` to run the command.

----------

`tar: Removing leading '/' from member names`

This is normal and prevents absolute path extraction.

----------

`File permissions incorrect after restore`

Ensure the command is using the  `--same-owner --preserve-permissions` options.

----------
