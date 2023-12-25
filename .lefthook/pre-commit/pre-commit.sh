#!/bin/zsh
echo "Checking your branch name"
LC_ALL=C

local_branch="$(git rev-parse --abbrev-ref HEAD)"

valid_branch_regex='^(feature|improvement|sit|hotfix)\/[0-9]+.[0-9]+.[0-9]+\/.*$|master'

message="$local_branch is bad branch name. See example: feature/1.0.1/some_text"

if [[ ! $local_branch =~ $valid_branch_regex ]]
then
    echo "$message"
    exit 1
fi

exit 0