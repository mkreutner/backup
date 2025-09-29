# Backup script
import os
import shutil
from datetime import datetime
import logging

def setup_logging():
    logging.basicConfig(
        filename='backup.log', 
        level=logging.INFO, 
        format='%(asctime)s - %(levelname)s - %(message)s'
    )

def backup_files(source_dir, backup_dir):
    """
    Backup files from source_dir to backup_dir with a timestamp.
    """
    if not os.path.exists(source_dir):
        logging.error(f"Source directory {source_dir} does not exist.")
        return

    if not os.path.exists(backup_dir):
        os.makedirs(backup_dir)
        logging.info(f"Created backup directory {backup_dir}.")

    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    backup_subdir = os.path.join(backup_dir, f"backup_{timestamp}")

    try:
        os.makedirs(backup_subdir)

        for item in os.listdir(source_dir):
            s = os.path.join(source_dir, item)
            d = os.path.join(backup_subdir, item)
            if os.path.isdir(s):
                shutil.copytree(s, d)
            else:
                shutil.copy2(s, d)

        logging.info(f"Backup completed successfully to {backup_subdir}.")
    except Exception as e:
        logging.error(f"Error during backup: {e}")

if __name__ == "__main__":
    setup_logging()
    SOURCE_DIR = '/home/mkreutner/Documents'  # Directory to backup
    BACKUP_DIR = '/home/mkreutner/Backups'  # Directory where backups are stored
    backup_files(SOURCE_DIR, BACKUP_DIR)