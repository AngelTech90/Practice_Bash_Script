#!/bin/bash

#############################################
# Daily Backup Script
# Zips Posts_ideas and moves to backup directory
# Executes automatically at 9 AM every day
#############################################

# Configuration - MODIFY THESE PATHS AS NEEDED
SOURCE_PATH="Posts_ideas"
BACKUP_DIR="backup"

# Generate timestamp for zip filename
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ZIP_FILENAME="Posts_ideas_${TIMESTAMP}.zip"

echo "=== Daily Backup Script - $(date '+%Y-%m-%d %H:%M:%S') ==="

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Check if source exists
if [ ! -e "$SOURCE_PATH" ]; then
    echo "Error: $SOURCE_PATH not found!"
    exit 1
fi

# Create zip file
echo "Creating zip file: $ZIP_FILENAME"
if [ -d "$SOURCE_PATH" ]; then
    # If it's a directory, zip the entire folder
    zip -r "$ZIP_FILENAME" "$SOURCE_PATH" > /dev/null 2>&1
else
    # If it's a file, zip just the file
    zip "$ZIP_FILENAME" "$SOURCE_PATH" > /dev/null 2>&1
fi

# Check if zip was created successfully
if [ ! -f "$ZIP_FILENAME" ]; then
    echo "Error: Failed to create zip file!"
    exit 1
fi

# Remove all old zip files from backup directory
echo "Removing old backups from $BACKUP_DIR..."
rm -f "$BACKUP_DIR"/*.zip

# Move new zip to backup directory
mv "$ZIP_FILENAME" "$BACKUP_DIR/"

if [ $? -eq 0 ]; then
    echo "✓ Backup completed successfully: $BACKUP_DIR/$ZIP_FILENAME"
    exit 0
else
    echo "Error: Failed to move zip file to backup directory!"
    exit 1
fi