for Test
==========

Script of this directory is used for the test.

## Require Package

- jq

Please install these package by following command:

    $ sudo apt-get install jq

## How to run test

First, please run all test monitoring servers.
And, please run with following command in this directory:

    $ ./runTest.sh

We expect following result:

    Check Hostgroup and Host
    Machine 2
    Result:OK
    Machine 6
    Result:OK
    Machine 7
    Result:OK
    
    Check Trigger and Item
    Machine 1 Trigger
    Result:OK
    Machine 1 Item
    Result:OK
    Machine 4 Trigger
    Result:OK
    Machine 4 Item
    Result:OK
    Machine 5 Trigger
    Result:OK
    Machine 5 Item
    Result:OK
