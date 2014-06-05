#!/bin/sh

TOKEN_1=$1
TOKEN_4=$2
TOKEN_5=$3

echo "Machine 1 Trigger"
curl -s -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":"'${TOKEN_1}'","method":"trigger.get","id":1,"params":{"output":"extend","templateids":"10089","triggerids":"13592"},"jsonrpc":"2.0"}' \
	http://10.0.3.11/zabbix/api_jsonrpc.php
echo ""

echo "Machine 1 Item"
curl -s -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":"'${TOKEN_1}'","method":"item.get","id":1,"params":{"output":"extend","templateids":"10089","itemids":"23531"},"jsonrpc":"2.0"}' \
	http://10.0.3.11/zabbix/api_jsonrpc.php
echo ""

echo "Machine 4 Trigger"
curl -s -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":"'${TOKEN_4}'","method":"trigger.get","id":1,"params":{"output":"extend","templateids":"10001","triggerids":"10016"},"jsonrpc":"2.0"}' \
	http://10.0.3.41/zabbix/api_jsonrpc.php
echo ""

echo "Machine 4 Item"
curl -s -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":"'${TOKEN_4}'","method":"item.get","id":1,"params":{"output":"extend","templateids":"10001","itemids":"22181"},"jsonrpc":"2.0"}' \
	http://10.0.3.41/zabbix/api_jsonrpc.php
echo ""

echo "Machine 5 Trigger"
curl -s -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":"'${TOKEN_5}'","method":"trigger.get","id":1,"params":{"output":"extend","templateids":"10089","triggerids":"13591"},"jsonrpc":"2.0"}' \
	http://10.0.3.51/zabbix/api_jsonrpc.php
echo ""

echo "Machine 5 Item"
curl -s -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":"'${TOKEN_5}'","method":"item.get","id":1,"params":{"output":"extend","templateids":"10089","itemids":"23532"},"jsonrpc":"2.0"}' \
	http://10.0.3.51/zabbix/api_jsonrpc.php
echo ""
