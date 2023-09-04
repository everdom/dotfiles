#!/bin/bash
if [[ ! -z $WSL_DISTRO_NAME ]];then

export TOYS_WSL_WINDOWS_HOST_IP=`cat /etc/resolv.conf|grep nameserver|awk '{print $2}'`

#关闭Windows侧adb server转发，当Windows侧adb server出现异常时执行；
function adb_stop_server_win() {
    unset ADB_SERVER_SOCKET
    adb.exe kill-server
    adb_server_pids=`ps -A | grep "adb.exe" | awk '{print $1}'`
    for pid in $adb_server_pids
    do
        kill $pid
    done
}

#开启Windows侧adb server转发并设定WSL2内的环境变量，开新窗口后需要执行；
function adb_start_server_win() {
    port=5037
    adb_server_pids=`ps -A | grep "adb.exe" | awk '{print $1}'`
    if [[ -z $adb_server_pids ]];then
        adb.exe -a -P $port nodaemon server &
    fi    
    export ADB_SERVER_SOCKET=tcp:$TOYS_WSL_WINDOWS_HOST_IP:$port
}

#重新执行整个转发流程
function adb_restart_server_win() {
    adb_stop_server_win
    adb_start_server_win
}

if [ "$1" = "start" ];then
  adb_start_server_win
elif [ "$1" = "stop" ];then
  adb_stop_server_win
elif [ "$1" = "restart" ];then
  adb_restart_server_win
fi
fi
