#!/bin/sh

cd `dirname $0`
BIN_DIR=`pwd`
cd ..
DEPLOY_DIR=`pwd`
CONF_DIR=$DEPLOY_DIR/config

PIDFILE=/home/haier/${project.name}.pid
PIDFILE=${PIDFILE//-/_}

if [ -f "$PIDFILE" ] ; then
    kill -9 $(cat "$PIDFILE")
    rm "$PIDFILE"
    echo "STOPPED"
    exit 0;
fi


PIDS=`ps -e -o 'pid=' -o 'command='|grep java|grep "${project.name}"|awk '{print $1}'`
if [ -z "$PIDS" ]; then
      echo "no process to stop (may be not start)"
    else
for PID in $PIDS ; do
  kill $PID > /dev/null 2>&1
  echo "  PID: $PID"
done

echo -e "  Waiting PIDS to quit ...\c"
COUNT=0
while [ $COUNT -lt 1 ]; do
        echo -e ".\c"
        sleep 1
        COUNT=1
        for PID in $PIDS ; do
        PID_EXIST=`ps -p $PID|tail -n +2|wc -l`
        if [ "$PID_EXIST" -gt 0 ]; then
            COUNT=0
            break
        fi
        done
    done
      echo "STOPPED"
fi