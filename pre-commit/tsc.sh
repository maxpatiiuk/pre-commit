#!/bin/bash

# Run Typescript Typecheker (`npx tsc`)
# Configuration options can be specified in `tsconfig.json`

RED='\033[0;31m'
NC='\033[0m'

if ! command -v npx &> /dev/null
then
  echo -e "${RED}\`npx\` is not installed. Please install it from here: https://www.npmjs.com/package/npx${NC}"
  exit 1
fi

if ! command -v npm &> /dev/null
then
  echo -e "${RED}\`npm\` is not installed. Please install it from here: https://www.npmjs.com/get-npm${NC}"
  exit 1
fi

if !(npm list -g | grep typescript > /dev/null);
then
  echo -e "${RED}Typescript is not installed. Please run \`npm install typescript\`${NC}"
fi

if [ $# -eq 0 ]
then
  # find tsconfig.json, if there is any
  tsconfig="$(find . -type d \( -name node_modules -o -name .idea \) -prune -false -o -name 'tsconfig.json' | head -1)"
  if [ -z "$tsconfig" ];
  then
    echo "Unable to find \`tsconfig.json\`. It's location was not provided. This hook would now exit"
    exit 0
  fi
else
  tsconfig="${1}"
fi

if [ -z "$tsconfig" ];
then
  echo -e "${RED}Unable to find \`tsconfig.json\`. Please specify it's location as the first argument${NC}"
  exit 1
fi


result=`cd "${tsconfig%/*}/" && npx tsc --noEmit --pretty true`
if [ -n "$result" ]
then
  echo "$result"
  echo -e "${RED}TypeScript typechecker returned errors${NC}"
  exit 1
fi

exit 0
