#!/bin/sh

. ./expect.sh

TOKEN_1=$(curl -s -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":null,"method":"user.login","id":1,"params":{"user":"admin","password":"zabbix"},"jsonrpc":"2.0"}' \
	http://10.0.3.11/zabbix/api_jsonrpc.php | jq '.result')
TOKEN_2=$(curl -s -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":null,"method":"user.login","id":1,"params":{"user":"admin","password":"zabbix"},"jsonrpc":"2.0"}' \
	http://10.0.3.21/zabbix/api_jsonrpc.php | jq '.result')
TOKEN_4=$(curl -s -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":null,"method":"user.login","id":1,"params":{"user":"admin","password":"zabbix"},"jsonrpc":"2.0"}' \
	http://10.0.3.41/zabbix/api_jsonrpc.php | jq '.result')
TOKEN_5=$(curl -s -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":null,"method":"user.login","id":1,"params":{"user":"admin","password":"zabbix"},"jsonrpc":"2.0"}' \
	http://10.0.3.51/zabbix/api_jsonrpc.php | jq '.result')
TOKEN_6=$(curl -s -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":null,"method":"user.login","id":1,"params":{"user":"admin","password":"zabbix"},"jsonrpc":"2.0"}' \
	http://10.0.3.61/zabbix/api_jsonrpc.php | jq '.result')
TOKEN_7=$(curl -s -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":null,"method":"user.login","id":1,"params":{"user":"Admin","password":"zabbix"},"jsonrpc":"2.0"}' \
	http://10.0.3.71/zabbix/api_jsonrpc.php | jq '.result')

echo "Check Hostgroup and Host"
echo "Machine 2"
ACTUAL_2=$(curl -s -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":'${TOKEN_2}',"method":"hostgroup.get","id":1,"params":{"output":"extend","filter":{"name":["GroupA","GroupB"]},"selectHosts":"refer"},"jsonrpc":"2.0"}' \
	http://10.0.3.21/zabbix/api_jsonrpc.php)
if [ "${ACTUAL_2}" = "${EXPECT_2}" ];
then
	echo "Result:OK"
else
	echo "Result:NG"
	echo "${ACTUAL_2}"
fi

echo "Machine 6"
ACTUAL_6=$(curl -s -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":'${TOKEN_6}',"method":"hostgroup.get","id":1,"params":{"output":"extend","filter":{"name":["GroupA","GroupB"]},"select_hosts":"refer"},"jsonrpc":"2.0"}' \
	http://10.0.3.61/zabbix/api_jsonrpc.php)
if [ "${ACTUAL_6}" = "${EXPECT_6}" ];
then
	echo "Result:OK"
else
	echo "Result:NG"
	echo "${ACTUAL_6}"
fi

echo "Machine 7"
ACTUAL_7=$(curl -s -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":'${TOKEN_7}',"method":"hostgroup.get","id":1,"params":{"output":"extend","filter":{"name":["GroupA","GroupB"]},"selectHosts":"refer"},"jsonrpc":"2.0"}' \
	http://10.0.3.71/zabbix/api_jsonrpc.php)
if [ "${ACTUAL_7}" = "${EXPECT_7}" ];
then
	echo "Result:OK"
else
	echo "Result:NG"
	echo "${ACTUAL_7}"
fi

echo "\nCheck language of trigger name and item name"
echo "Machine 1 Trigger"
ACTUAL_1_TRIGGER=$(curl -s -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":'${TOKEN_1}',"method":"trigger.get","id":1,"params":{"output":"extend","templateids":"10089","triggerids":"13592"},"jsonrpc":"2.0"}' \
	http://10.0.3.11/zabbix/api_jsonrpc.php)
if [ "${ACTUAL_1_TRIGGER}" = "${EXPECT_1_TRIGGER}" ];
then
	echo "Result:OK"
else
	echo "Result:NG"
	echo "${ACTUAL_1_TRIGGER}"
fi

echo "Machine 1 Item"
ACTUAL_1_ITEM=$(curl -s -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":'${TOKEN_1}',"method":"item.get","id":1,"params":{"output":"extend","templateids":"10089","itemids":"23531"},"jsonrpc":"2.0"}' \
	http://10.0.3.11/zabbix/api_jsonrpc.php)
if [ "${ACTUAL_1_ITEM}" = "${EXPECT_1_ITEM}" ];
then
	echo "Result:OK"
else
	echo "Result:NG"
	echo "${ACTUAL_1_ITEM}"
fi

echo "Machine 4 Trigger"
ACTUAL_4_TRIGGER=$(curl -s -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":'${TOKEN_4}',"method":"trigger.get","id":1,"params":{"output":"extend","templateids":"10001","triggerids":"10016"},"jsonrpc":"2.0"}' \
	http://10.0.3.41/zabbix/api_jsonrpc.php)
if [ "${ACTUAL_4_TRIGGER}" = "${EXPECT_4_TRIGGER}" ];
then
	echo "Result:OK"
else
	echo "Result:NG"
	echo "${ACTUAL_4_TRIGGER}"
fi

echo "Machine 4 Item"
ACTUAL_4_ITEM=$(curl -s -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":'${TOKEN_4}',"method":"item.get","id":1,"params":{"output":"extend","templateids":"10001","itemids":"22181"},"jsonrpc":"2.0"}' \
	http://10.0.3.41/zabbix/api_jsonrpc.php)
if [ "${ACTUAL_4_ITEM}" = "${EXPECT_4_ITEM}" ];
then
	echo "Result:OK"
else
	echo "Result:NG"
	echo "${ACTUAL_4_ITEM}"
fi

echo "Machine 5 Trigger"
ACTUAL_5_TRIGGER=$(curl -s -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":'${TOKEN_5}',"method":"trigger.get","id":1,"params":{"output":"extend","templateids":"10089","triggerids":"13591"},"jsonrpc":"2.0"}' \
	http://10.0.3.51/zabbix/api_jsonrpc.php)
if [ "${ACTUAL_5_TRIGGER}" = "${EXPECT_5_TRIGGER}" ];
then
	echo "Result:OK"
else
	echo "Result:NG"
	echo "${ACTUAL_5_TRIGGER}"
fi

echo "Machine 5 Item"
ACTUAL_5_ITEM=$(curl -s -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":'${TOKEN_5}',"method":"item.get","id":1,"params":{"output":"extend","templateids":"10089","itemids":"23532"},"jsonrpc":"2.0"}' \
	http://10.0.3.51/zabbix/api_jsonrpc.php)
if [ "${ACTUAL_5_ITEM}" = "${EXPECT_5_ITEM}" ];
then
	echo "Result:OK"
else
	echo "Result:NG"
	echo "${ACTUAL_5_ITEM}"
fi
