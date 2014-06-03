#!/bin/sh

echo "for Zabbix 1.8"
curl -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":null,"method":"user.login","id":1,"params":{"user":"admin","password":"zabbix"},"jsonrpc":"2.0"}' \
	http://10.0.3.61/zabbix/api_jsonrpc.php
echo ""

echo "for Zabbix 2.0"
curl -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":null,"method":"user.login","id":1,"params":{"user":"admin","password":"zabbix"},"jsonrpc":"2.0"}' \
	http://10.0.3.21/zabbix/api_jsonrpc.php
echo ""

echo "for Zabbix 2.2"
curl -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":null,"method":"user.login","id":1,"params":{"user":"Admin","password":"zabbix"},"jsonrpc":"2.0"}' \
	http://10.0.3.71/zabbix/api_jsonrpc.php
echo ""
