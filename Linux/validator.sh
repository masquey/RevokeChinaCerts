#!/bin/sh
# This script accesses the test sites described in README.
# This file should be updated according to README file.

base() {
    # use cnnic.cn so that it matches the address in the cert
    # served, rather than cnnic.net.cn as presented in README
    wget -O /dev/null https://www.cnnic.cn/ 2>/dev/null && \
    wget -O /dev/null https://evdemo.cnnic.cn/ 2>/dev/null && \
    wget -O /dev/null https://wacc.n.shifen.com/ 2>/dev/null && \
    wget -O /dev/null https://mail.ztgame.com/ 2>/dev/null && \
    wget -O /dev/null https://211.146.10.133/ 2>/dev/null
    RESULT=$?
    if [ $RESULT -eq 0 ];then
        echo "Failed test sites for BASE incremental-set"
    else
        echo "Passed test sites for BASE incremental-set"
    fi
}

extended() {
    wget -O /dev/null https://cstest.cfca.com.cn/ 2>/dev/null && \
    wget -O /dev/null https://cs.cfca.com.cn/ 2>/dev/null && \
    wget -O /dev/null https://www.sheca.com/ 2>/dev/null && \
    wget -O /dev/null https://ibanks.bankofshanghai.com/ 2>/dev/null
    RESULT=$?
    if [ $RESULT -eq 0 ];then
        echo "Failed test sites for EXTENDED incremental-set"
    else
        echo "Passed test sites for EXTENDED incremental-set"
    fi
}

all() {
    wget -O /dev/null https://www.wosign.com/ 2>/dev/null
    RESULT=$?
    if [ $RESULT -eq 0 ];then
        echo "Failed test sites for ALL incremental-set"
    else
        echo "Passed test sites for ALL incremental-set"
    fi
}

echo "---------------------"
echo "Beginning tests."
echo "There are 3 tests (BASE/EXTENDED/ALL), each of which would print a"\
    " 'Passed test' if passes"
echo "---------------------"
base
extended
all
echo "---------------------"
echo "All tests executed."
