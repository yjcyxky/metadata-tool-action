#!/bin/bash

set -e

DATA_DIR=$1
export DB_PASSWD=$INPUT_DBPASSWD
export AUTH_KEY=$INPUT_AUTHKEY
export AUTH_VALUE=$INPUT_AUTHVALUE
export DINGTALK_ACCESS_TOKEN=$INPUT_DINGTALKACCESSTOKEN
export DINGTALK_ACCESS_SECRET=$INPUT_DINGTALKACCESSSECRET
export TEST_MODE=$2

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
else
    echo "DB_PASSWD: ${DB_PASSWD}, AUTH_KEY: ${AUTH_KEY}, AUTH_VALUE: ${AUTH_VALUE}"
    echo "DINGTALK_ACCESS_TOKEN: ${DINGTALK_ACCESS_TOKEN}, DINGTALK_ACCESS_SECRET: ${DINGTALK_ACCESS_SECRET}"
fi

echo ::set-output name=command::$COMMAND
