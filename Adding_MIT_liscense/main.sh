#!/bin/bash

# Color codes for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}=== Adding LICENSE to all repositories ===${NC}\n"

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check if LICENSE file exists in script directory
if [ ! -f "$SCRIPT_DIR/LICENSE" ]; then
    echo -e "${RED}ERROR: LICENSE file not found in $SCRIPT_DIR${NC}"
    echo "Please place your LICENSE file in the same directory as this script."
    exit 1
fi

# Counter for statistics
total_repos=0
successful=0
failed=0
skipped=0

# Loop through all directories in the current directory
for dir in "$SCRIPT_DIR"/*/ ; do
    # Remove trailing slash
    dir=${dir%/}
    
    # Get just the directory name
    dir_name=$(basename "$dir")
    
    # Skip if it's not a directory
    if [ ! -d "$dir" ]; then
        continue
    fi
    
    ((total_repos++))
    
    echo -e "${YELLOW}Processing: $dir_name${NC}"
    
    # Check if LICENSE already exists
    if [ -f "$dir/LICENSE" ]; then
        echo -e "${YELLOW}  ⚠ LICENSE already exists, skipping...${NC}\n"
        ((skipped++))
        continue
    fi
    
    # Copy LICENSE file to the directory
    cp "$SCRIPT_DIR/LICENSE" "$dir/LICENSE"
    
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}  ✓ LICENSE created successfully${NC}"
        
        # Change to the directory and run the upload script
        cd "$dir"
        upload_changes_git.sh

    else
        echo -e "${RED}  ✗ Failed to create LICENSE${NC}\n"
        ((failed++))
    fi
done

# Print summary
echo -e "${GREEN}=== Summary ===${NC}"
echo -e "Total repositories found: $total_repos"
echo -e "${GREEN}Successfully processed: $successful${NC}"
echo -e "${YELLOW}Skipped (already had LICENSE): $skipped${NC}"
echo -e "${RED}Failed: $failed${NC}"
