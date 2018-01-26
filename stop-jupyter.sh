#!/usr/bin/env bash

PID_FILE=/var/run/jupyter.pid
LOG_FILE=/var/log/jupyter.log

if [ -f $PID_FILE ]; then
  JPID=$(cat /var/run/jupyter.pid)
  echo "Stop Jupyter Service..."
  kill -SIGINT $JPID
  echo "Log File: $LOG_FILE"
  echo "Latest Logs: "
  tail -n 10 $LOG_FILE
else
  echo "Stop Jupyter Failed: Pid File Not Found"
fi

