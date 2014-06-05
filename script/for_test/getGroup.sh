#!/bin/sh

TOKEN_2=$1
TOKEN_6=$2
TOKEN_7=$3

EXPECT_2='{"jsonrpc":"2.0","result":[{"hosts":[{"groups":[{"groupid":"6"}],"hostid":"10085"},{"groups":[{"groupid":"6"}],"hostid":"10086"},{"groups":[{"groupid":"6"},{"groupid":"7"}],"hostid":"10087"},{"groups":[{"groupid":"6"},{"groupid":"7"}],"hostid":"10088"}],"groupid":"6","name":"GroupA","internal":"0"},{"hosts":[{"groups":[{"groupid":"6"},{"groupid":"7"}],"hostid":"10087"},{"groups":[{"groupid":"6"},{"groupid":"7"}],"hostid":"10088"}],"groupid":"7","name":"GroupB","internal":"0"}],"id":1}'
EXPECT_6='{"jsonrpc":"2.0","result":[{"hosts":[{"groups":[{"groupid":"6"}],"hostid":"10049"},{"groups":[{"groupid":"6"}],"hostid":"10050"},{"groups":[{"groupid":"6"},{"groupid":"7"}],"hostid":"10051"},{"groups":[{"groupid":"6"},{"groupid":"7"}],"hostid":"10052"}],"groupid":"6","name":"GroupA","internal":"0"},{"hosts":[{"groups":[{"groupid":"6"},{"groupid":"7"}],"hostid":"10051"},{"groups":[{"groupid":"6"},{"groupid":"7"}],"hostid":"10052"}],"groupid":"7","name":"GroupB","internal":"0"}],"id":1}'
EXPECT_7='{"jsonrpc":"2.0","result":[{"groupid":"8","name":"GroupA","internal":"0","flags":"0","hosts":[{"hostid":"10105"},{"hostid":"10106"},{"hostid":"10107"},{"hostid":"10108"}]},{"groupid":"9","name":"GroupB","internal":"0","flags":"0","hosts":[{"hostid":"10107"},{"hostid":"10108"}]}],"id":1}'

echo "Machine 2"
ACTUAL_2=$(curl -s -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":"'${TOKEN_2}'","method":"hostgroup.get","id":1,"params":{"output":"extend","filter":{"name":["GroupA","GroupB"]},"selectHosts":"refer"},"jsonrpc":"2.0"}' \
	http://10.0.3.21/zabbix/api_jsonrpc.php)
if [ "${ACTUAL_2}" = "${EXPECT_2}" ];
then
	echo "OK"
else
	echo "NG"
	echo "${ACTUAL_2}"
fi

echo "Machine 6"
ACTUAL_6=$(curl -s -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":"'${TOKEN_6}'","method":"hostgroup.get","id":1,"params":{"output":"extend","filter":{"name":["GroupA","GroupB"]},"select_hosts":"refer"},"jsonrpc":"2.0"}' \
	http://10.0.3.61/zabbix/api_jsonrpc.php)
if [ "${ACTUAL_6}" = "${EXPECT_6}" ];
then
	echo "OK"
else
	echo "NG"
	echo "${ACTUAL_6}"
fi

echo "Machine 7"
ACTUAL_7=$(curl -s -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":"'${TOKEN_7}'","method":"hostgroup.get","id":1,"params":{"output":"extend","filter":{"name":["GroupA","GroupB"]},"selectHosts":"refer"},"jsonrpc":"2.0"}' \
	http://10.0.3.71/zabbix/api_jsonrpc.php)
if [ "${ACTUAL_7}" = "${EXPECT_7}" ];
then
	echo "OK"
else
	echo "NG"
	echo "${ACTUAL_7}"
fi
