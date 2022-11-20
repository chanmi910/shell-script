#!/bin/bash
# command example>  ./copy-changed-files-from-git.sh 482fa678 0734ad90

CURRENT_PATH=`pwd`
TARGET_PATH=git_diff

GIT_DIFF_RESULT=`git diff --name-only $1 $2`

rm -rf $TARGET_PATH

for LIST in $GIT_DIFF_RESULT; do
    FILE_PATH=`dirname $LIST`
    mkdir -p $TARGET_PATH/$FILE_PATH
    cp -r $CURRENT_PATH/$LIST $TARGET_PATH/$FILE_PATH
done 

echo "[copy success] path: $CURRENT_PATH/$TARGET_PATH"

