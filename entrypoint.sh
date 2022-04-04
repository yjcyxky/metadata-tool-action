#!/bin/bash

set -e

DATA_DIR=$1
export DB_PASSWD=$2
export AUTH_KEY=$3
export AUTH_VALUE=$4
export DINGTALK_ACCESS_KEY=$5
export DINGTALK_ACCESS_SECRET=$6
export TEST_MODE=$7

COMMAND="java -jar /opt/metadata-tool.jar -d ${DATA_DIR} -m -n -D"
echo "Runing command: ${COMMAND}"

if [ "$TEST_MODE" == 'false' ]; then
    if [ ! -f "$DATA_DIR/env.sh" ];then
        echo "ERROR: not found env.sh in the data directory"
        exit 1
    else
        echo "Set environment variables in $DATA_DIR/env.sh..."
        source $DATA_DIR/env.sh
        java -jar /opt/metadata-tool.jar -d ${DATA_DIR} -m -n -D
    fi
fi

echo ::set-output name=command::$COMMAND
