# 🔹 FULL TAR BACKUP 🔹

## Overview
FULL TAR BACKUP is a simple and effective Bash script solution for **creating, managing, and restoring full system backups** using `tar` and `gzip` These scripts allow Linux users to **efficiently back up and restore their systems** while preserving file ownership, groups, and permissions.

---

## 🚀 Functions
- **Automated full system backups** (`tar_backup.sh`)
- **Automated cleanup of old backups** (`tar_cleanup.sh`)
- **Interactive restore guide** (`tar_restore.sh`)
- **Preserves file permissions, ownership, and groups**
- **Uses only built-in Linux tools (`tar,` `gzip`)**
- **Safe and easy-to-use CLI interface**

---

## 📂 File Structure
| File               | Description |
|--------------------|-------------|
| `tar_backup.sh`   | Creates a full system backup and saves it as a `.tar.gz` file. |
| `tar_cleanup.sh`  | Deletes old backups older than **3 days** to free up space. |
| `tar_restore.sh`  | Interactive guide to restoring files, directories, or the full system. |

---

## 🔧 **Installation & Setup**
1. Clone this repository:

  ```bash
   git clone https://github.com/LinuxSystemsEngineer/full_tar_backup_system.git
```

2. Change directories into the newly cloned repo

  ```bash
   cd full_tar_backup_system
```

3. Grant permissions to all .sh files in the current working directory:
    
  ```bash
   chmod +x *.sh
```
    

----------

## 🔄 **Usage Guide**

Run with **sudo** to ensure proper permissions.

### 🛠 **1. Running the Backup Script**

To **create a full system backup**, run:


   ```bash
sudo ./tar_backup.sh
```

-   This will generate a `full-tar-backup.tar.gz` file in the current directory.
-   The script **excludes** unnecessary system paths (`/proc,` `/lost+found,` `/mnt,` `/run,` `/tmp`).
-   It **preserves file ownership, groups, and permissions**.

----------

### ✅ **2. Cleaning Up Old Backups**

To **delete backups older than 3 days**, run:


   ```bash
sudo ./tar_cleanup.sh
```

This script automatically finds and removes old `.tar.gz` backups, helping you save disk space.

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

`tar: Removing leading '/' from member names

Normal and prevents absolute path extraction.

----------

`File permissions incorrect after restore.`

Ensure the command uses the  `--same-owner --preserve-permissions` options.

----------
