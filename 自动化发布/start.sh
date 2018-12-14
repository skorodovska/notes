#!/bin/sh

cd `dirname $0`
BIN_DIR=`pwd`
cd ..
WORKDIR=`pwd`
CONF_DIR=$WORKDIR/config

LIB_DIR=$WORKDIR/lib
LIB_JARS=`ls $LIB_DIR|grep .jar|awk '{print "'$LIB_DIR'/"$0}'|tr "\n" ":"`
CLASS_PATH=$WORKDIR:$LIB_JARS

PROFILE=""
OPT_PROFILE=""
if [ $# -gt 0 ];then

    for arg in $*
    do
        if [[ $arg == profile* ]] ; then
            if [ "" != ${arg:8} ] ; then
                PROFILE=${arg:8}
                OPT_PROFILE="-Dspring.profiles.active=$PROFILE"
            fi
        elif [ $arg == port* ] ; then
            if [ "" != ${arg:5} ] ; then
                SERVER_PORT=${arg:5}
            fi
        fi
    done

fi

CONFIG_FILE="$CONF_DIR/application.yml"
if [ -n "$PROFILE" ] ; then
    CONFIG_FILE="$CONF_DIR/application-$PROFILE.yml"
fi

if [ "$SERVER_PORT" == "" ]; then
    SERVER_PORT=`sed '/^#/d;/server.port/!d;s/.*=//' $CONFIG_FILE | tr -d '\r'`
fi

if [ "$SERVER_PORT" != "" ]; then
    PORT_OPTS="-Dserver.port=$SERVER_PORT"
fi

SERVER_HOST=`sed '/^#/d;/server.address/!d;s/.*=//' $CONFIG_FILE | tr -d '\r'`
if [ -z "$SERVER_HOST" ]; then
    SERVER_HOST=127.0.0.1
fi

SERVER_NAME=`sed '/^#/d;/server.display-name/!d;s/.*=//' $CONFIG_FILE | tr -d '\r'`
if [ -z "$SERVER_NAME" ]; then
	SERVER_NAME="${project.name}"
fi
SERVER_NAME=${SERVER_NAME//-/_}
INSTANCE=$SERVER_NAME
PIDFILE=/home/haier/$SERVER_NAME.pid
#PIDFILE=${PIDFILE//-/_}

if [ "$JAVA_HOME" != "" ]; then
  JAVA="$JAVA_HOME/bin/java"
else
  JAVA=java
fi

local_ip=`ip a | grep inet | grep -v inet6 | grep -v 127 | sed 's/^[ \t]*//g' | cut -d ' ' -f2 |head -1`
local_ip=${local_ip//\//_}
local_ip=${local_ip//\./_}
AGENTID="$local_ip_$INSTANCE"
AGENT_FILE="/usr/local/pinpoint/pinpoint-bootstrap-1.7.1.jar"
if [ -f "$AGENT_FILE" ] ; then
    AGENT_OPTS=" -javaagent:$AGENT_FILE -Dpinpoint.agentId=$AGENTID -Dpinpoint.applicationName=$SERVER_NAME"
    echo "using agent $AGENT_OPTS"
fi

echo "using jdk $JAVA"
echo "using profile $OPT_PROFILE"
echo "Starting $INSTANCE ... "

sleep 2

#if [ -f "$PIDFILE" ]; then
#  if kill -0 `cat "$PIDFILE"` > /dev/null 2>&1; then
#     echo progress already running as process `cat "$PIDFILE"`.
#     exit 0
#  fi
#fi
#PIDS=`ps -e -o 'pid=' -o 'command='|grep java|grep "$INSTANCE"|awk '{print $1}'`
if [ -e "$PIDFILE" ]; then
    # 服务已经启动
    echo "ERROR: The $INSTANCE already started!"
    exit 1
fi

if [ -n "$SERVER_PORT" ]; then
    # 端口号是否被占用
    # netstat的输出格式:
    # linux:10.9.10.178:10050
    # Mac OSX: 192.168.169.5.56508
    if [ "$OS" == "unix" ]; then
        SERVER_PORT_COUNT=`netstat -ant -p tcp|tail -n +3|awk '{print $4}'|grep '[.:]$SERVER_PORT' -c`
    else
        SERVER_PORT_COUNT=`netstat -ant|tail -n +3|awk '{print $4}'|grep '[.:]$SERVER_PORT' -c`
    fi
    if [ $SERVER_PORT_COUNT -gt 0 ]; then
        echo "ERROR:  Port $SERVER_PORT already used!"
        exit 1
    fi
fi

if test -f  $WORKDIR/fs.out
then
      cat /dev/null $WORKDIR/fs.out
fi

#nohup "$JAVA" -Xdebug -Xrunjdwp:transport=dt_socket,address=10000,server=y,suspend=n -jar $JAVA_OPTS $PORT_OPTS -DappName=$INSTANCE $OPT_PROFILE ${project.name}.jar > fs.out 2>&1 < /dev/null &
nohup "$JAVA" $AGENT_OPTS -DappName=$INSTANCE $PORT_OPTS -classpath $CLASS_PATH $OPT_PROFILE ${mainClass} > $WORKDIR/fs.out 2>&1 < /dev/null &
#nohup "$JAVA" -jar $JAVA_OPTS $PORT_OPTS -DappName=$INSTANCE $OPT_PROFILE $WORKDIR/${project.build.finalName}.jar > $WORKDIR/fs.out 2>&1 < /dev/null &
if [ $? -eq 0 ]
    then
      case "$OSTYPE" in
      *solaris*)
        /bin/echo "${!}\\c" > "$PIDFILE"
                  ;;
      *)
        echo -n $! > "$PIDFILE"
        ;;
      esac
fi

#COUNT=0
#while [ $COUNT -lt 1 ]; do
#    echo -e ".\c"
#    sleep 1
#    # 能够连通服务端口号，则服务启动完成
#    COUNT=`echo status | nc -4 -i 1 $SERVER_HOST $SERVER_PORT | grep -c OK`
#done
#echo "OK!"

while [ -f $WORKDIR/fs.out ];
do
    result=`grep "Started Server" $WORKDIR/fs.out`
    if [ "$result" != "" ]
    then
        echo "springboot started ........."
        break
    else
        echo -e ".\c"
        sleep 1
    fi
done
echo "OK!"



