#!/bin/sh

TOKEN_2=$1
TOKEN_6=$2
TOKEN_7=$3

echo "Machine 2"
ACTUAL_2=$(curl -s -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":"'${TOKEN_2}'","method":"hostgroup.get","id":1,"params":{"output":"extend","filter":{"name":["GroupA","GroupB"]},"selectHosts":"refer"},"jsonrpc":"2.0"}' \
	http://10.0.3.21/zabbix/api_jsonrpc.php)
echo "${ACTUAL_2}"

echo "Machine 6"
ACTUAL_6=$(curl -s -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":"'${TOKEN_6}'","method":"hostgroup.get","id":1,"params":{"output":"extend","filter":{"name":["GroupA","GroupB"]},"select_hosts":"refer"},"jsonrpc":"2.0"}' \
	http://10.0.3.61/zabbix/api_jsonrpc.php)
echo "${ACTUAL_6}"

echo "Machine 7"
ACTUAL_7=$(curl -s -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":"'${TOKEN_7}'","method":"hostgroup.get","id":1,"params":{"output":"extend","filter":{"name":["GroupA","GroupB"]},"selectHosts":"refer"},"jsonrpc":"2.0"}' \
	http://10.0.3.71/zabbix/api_jsonrpc.php)
echo "${ACTUAL_7}"
