#!/bin/bash

# if any regular expression from the dictionary returned matches in any
# of the change files, this would throw an error

RED='\033[0;31m'
NC='\033[0m'

dictionary="${1}"
changed_files="${@:2}"

for file in $changed_files; do
  if ["$dictionary" != "$file"] && (grep "$file" -E -C 4 -n --color -f "$dictionary");
  then
    echo -e "${RED}Found blacklisted matches in \"$file\"${NC}"
    exit 1
  fi
done

exit 0
