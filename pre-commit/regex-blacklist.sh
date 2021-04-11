#!/bin/bash

# if any regular expression from the dictionary returned matches in any
# of the change files, this would throw an error

RED='\033[0;31m'
NC='\033[0m'

#HOOKS_PATH=`git config core.hookspath`
#ROOT_DIR=`git rev-parse --show-toplevel`

#changed_files=`git diff --name-only HEAD`

dictionary="${1}"
changed_files="${@:2}"

#for file in $changed_files; do
#  if (grep "${ROOT_DIR}/$file" -E -n --color -f "${HOOKS_PATH}pre-commit_blacklist-dict.txt");
#  then
#    echo -e "${RED} Found blacklisted matches in ${ROOT_DIR}/$file"
#    exit 1
#  fi
#done

for file in $changed_files; do
  if (grep "$file" -E -n --color -f "$dictionary");
  then
    echo -e "${RED} Found blacklisted matches in \"$file\""
    exit 1
  fi
done

exit 0
