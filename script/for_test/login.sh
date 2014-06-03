#!/bin/sh

echo "Machine 6"
curl -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":null,"method":"user.login","id":1,"params":{"user":"admin","password":"zabbix"},"jsonrpc":"2.0"}' \
	http://10.0.3.61/zabbix/api_jsonrpc.php
echo ""

echo "Machine 2"
curl -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":null,"method":"user.login","id":1,"params":{"user":"admin","password":"zabbix"},"jsonrpc":"2.0"}' \
	http://10.0.3.21/zabbix/api_jsonrpc.php
echo ""

echo "Machine 7"
curl -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":null,"method":"user.login","id":1,"params":{"user":"Admin","password":"zabbix"},"jsonrpc":"2.0"}' \
	http://10.0.3.71/zabbix/api_jsonrpc.php
echo ""
