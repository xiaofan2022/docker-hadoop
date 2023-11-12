#!/bin/sh

check_port_and_execute() {
    host=$1
    port=$2
    while ! nc -z "$host" "$port"; do
        echo "等待 for $host:$port 上线..."
        sleep 1
    done
    if [ "$port" -eq 9050 ]; then
            # 执行相应的 MySQL 命令
            mysql -h 172.20.80.2 -P 9030 -uroot -e "ALTER SYSTEM ADD BACKEND \"$host:$port\""
            echo "成功添加$host:$port"
        else
            echo "端口$host：$port 成功启动"
    fi
}
check_port_and_execute "172.20.80.2" "9030"
# 检查端口 9050 是否开放并执行相应的 MySQL 命令
check_port_and_execute "172.20.80.3" "9050"

# 检查端口 9050 是否开放并执行相应的 MySQL 命令
check_port_and_execute "172.20.80.4" "9050"

# 检查端口 9050 是否开放并执行相应的 MySQL 命令
check_port_and_execute "172.20.80.5" "9050"

# 等待所有 MySQL 命令执行完成
wait
