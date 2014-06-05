#!/bin/sh

TOKEN_1=$1
TOKEN_4=$2
TOKEN_5=$3

EXPECT_1_TRIGGER='{"jsonrpc":"2.0","result":[{"triggerid":"13592","expression":"{13021}<0","description":"{HOST.NAME}\u304c\u518d\u8d77\u52d5\u3057\u307e\u3057\u305f","url":"","status":"0","value":"0","priority":"1","lastchange":"1400140114","comments":"","error":"Trigger just added. No status update so far.","templateid":"0","type":"0","value_flags":"1","flags":"0","hostid":"10089","hosts":[{"hostid":"10089"}]}],"id":1}'
EXPECT_1_ITEM='{"jsonrpc":"2.0","result":[{"itemid":"23531","type":"0","snmp_community":"","snmp_oid":"","hostid":"10089","name":"$1\u306e\u30c1\u30a7\u30c3\u30af\u30b5\u30e0","key_":"vfs.file.cksum[\/etc\/passwd]","delay":"3600","history":"7","trends":"365","lastvalue":"0","lastclock":"0","prevvalue":"0","status":"0","value_type":"3","trapper_hosts":"","units":"","multiplier":"0","delta":"0","prevorgvalue":"0","snmpv3_securityname":"","snmpv3_securitylevel":"0","snmpv3_authpassphrase":"","snmpv3_privpassphrase":"","formula":"1","error":"","lastlogsize":"0","logtimefmt":"","templateid":"0","valuemapid":"0","delay_flex":"","params":"","ipmi_sensor":"","data_type":"0","authtype":"0","username":"","password":"","publickey":"","privatekey":"","mtime":"0","lastns":"0","flags":"0","filter":"","interfaceid":"0","port":"","description":"","inventory_link":"0","lifetime":"30"}],"id":1}'
EXPECT_4_TRIGGER='{"jsonrpc":"2.0","result":[{"triggerid":"10016","expression":"{10199}>0","description":"\/etc\/passwd has been changed on {HOST.NAME}","url":"","status":"0","value":"0","priority":"2","lastchange":"0","comments":"","error":"","templateid":"0","type":"0","value_flags":"0","flags":"0","hostid":"10001","hosts":[{"hostid":"10001"}]}],"id":1}'
EXPECT_4_ITEM='{"jsonrpc":"2.0","result":[{"itemid":"22181","type":"0","snmp_community":"","snmp_oid":"","hostid":"10001","name":"Available memory","key_":"vm.memory.size[available]","delay":"60","history":"7","trends":"365","lastvalue":"0","lastclock":"0","prevvalue":"0","status":"0","value_type":"3","trapper_hosts":"","units":"B","multiplier":"0","delta":"0","prevorgvalue":"0","snmpv3_securityname":"","snmpv3_securitylevel":"0","snmpv3_authpassphrase":"","snmpv3_privpassphrase":"","formula":"1","error":"","lastlogsize":"0","logtimefmt":"","templateid":"0","valuemapid":"0","delay_flex":"","params":"","ipmi_sensor":"","data_type":"0","authtype":"0","username":"","password":"","publickey":"","privatekey":"","mtime":"0","lastns":"0","flags":"0","filter":"","interfaceid":"0","port":"","description":"Available memory is defined as free+cached+buffers memory.","inventory_link":"0","lifetime":"0"}],"id":1}'
EXPECT_5_TRIGGER='{"jsonrpc":"2.0","result":[{"triggerid":"13591","expression":"{13020}>0","description":"\/etc\/ m\u1eadt kh\u1ea9u \u0111\u00e3 \u0111\u01b0\u1ee3c thay \u0111\u1ed5i tr\u00ean {HOST.NAME}","url":"","status":"0","value":"0","priority":"2","lastchange":"1400200948","comments":"","error":"Trigger just added. No status update so far.","templateid":"0","type":"0","value_flags":"1","flags":"0","hostid":"10089","hosts":[{"hostid":"10089"}]}],"id":1}'
EXPECT_5_ITEM='{"jsonrpc":"2.0","result":[{"itemid":"23532","type":"0","snmp_community":"","snmp_oid":"","hostid":"10089","name":"B\u1ed9 nh\u1edb kh\u1ea3 d\u1ee5ng","key_":"vm.memory.size[available]","delay":"60","history":"7","trends":"365","lastvalue":"0","lastclock":"0","prevvalue":"0","status":"0","value_type":"3","trapper_hosts":"","units":"B","multiplier":"0","delta":"0","prevorgvalue":"0","snmpv3_securityname":"","snmpv3_securitylevel":"0","snmpv3_authpassphrase":"","snmpv3_privpassphrase":"","formula":"1","error":"","lastlogsize":"0","logtimefmt":"","templateid":"0","valuemapid":"0","delay_flex":"","params":"","ipmi_sensor":"","data_type":"0","authtype":"0","username":"","password":"","publickey":"","privatekey":"","mtime":"0","lastns":"0","flags":"0","filter":"","interfaceid":"0","port":"","description":"Available memory is defined as free+cached+buffers memory.","inventory_link":"0","lifetime":"30"}],"id":1}'

echo "Machine 1 Trigger"
ACTUAL_1_TRIGGER=$(curl -s -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":"'${TOKEN_1}'","method":"trigger.get","id":1,"params":{"output":"extend","templateids":"10089","triggerids":"13592"},"jsonrpc":"2.0"}' \
	http://10.0.3.11/zabbix/api_jsonrpc.php)
if [ "${ACTUAL_1_TRIGGER}" = "${EXPECT_1_TRIGGER}" ];
then
	echo "OK"
else
	echo "NG"
	echo "${ACTUAL_1_TRIGGER}"
fi

echo "Machine 1 Item"
ACTUAL_1_ITEM=$(curl -s -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":"'${TOKEN_1}'","method":"item.get","id":1,"params":{"output":"extend","templateids":"10089","itemids":"23531"},"jsonrpc":"2.0"}' \
	http://10.0.3.11/zabbix/api_jsonrpc.php)
if [ "${ACTUAL_1_ITEM}" = "${EXPECT_1_ITEM}" ];
then
	echo "OK"
else
	echo "NG"
	echo "${ACTUAL_1_ITEM}"
fi

echo "Machine 4 Trigger"
ACTUAL_4_TRIGGER=$(curl -s -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":"'${TOKEN_4}'","method":"trigger.get","id":1,"params":{"output":"extend","templateids":"10001","triggerids":"10016"},"jsonrpc":"2.0"}' \
	http://10.0.3.41/zabbix/api_jsonrpc.php)
if [ "${ACTUAL_4_TRIGGER}" = "${EXPECT_4_TRIGGER}" ];
then
	echo "OK"
else
	echo "NG"
	echo "${ACTUAL_4_TRIGGER}"
fi

echo "Machine 4 Item"
ACTUAL_4_ITEM=$(curl -s -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":"'${TOKEN_4}'","method":"item.get","id":1,"params":{"output":"extend","templateids":"10001","itemids":"22181"},"jsonrpc":"2.0"}' \
	http://10.0.3.41/zabbix/api_jsonrpc.php)
if [ "${ACTUAL_4_ITEM}" = "${EXPECT_4_ITEM}" ];
then
	echo "OK"
else
	echo "NG"
	echo "${ACTUAL_4_ITEM}"
fi

echo "Machine 5 Trigger"
ACTUAL_5_TRIGGER=$(curl -s -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":"'${TOKEN_5}'","method":"trigger.get","id":1,"params":{"output":"extend","templateids":"10089","triggerids":"13591"},"jsonrpc":"2.0"}' \
	http://10.0.3.51/zabbix/api_jsonrpc.php)
if [ "${ACTUAL_5_TRIGGER}" = "${EXPECT_5_TRIGGER}" ];
then
	echo "OK"
else
	echo "NG"
	echo "${ACTUAL_5_TRIGGER}"
fi

echo "Machine 5 Item"
ACTUAL_5_ITEM=$(curl -s -X GET -H "Content-Type:application/json-rpc" -d \
	'{"auth":"'${TOKEN_5}'","method":"item.get","id":1,"params":{"output":"extend","templateids":"10089","itemids":"23532"},"jsonrpc":"2.0"}' \
	http://10.0.3.51/zabbix/api_jsonrpc.php)
if [ "${ACTUAL_5_ITEM}" = "${EXPECT_5_ITEM}" ];
then
	echo "OK"
else
	echo "NG"
	echo "${ACTUAL_5_ITEM}"
fi
