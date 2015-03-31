#!/bin/sh
# This script accesses the test sites described in README.
# This file should be updated according to README file.

SOURCE_DIR=$(dirname "$0")

base() {
    # use cnnic.cn so that it matches the address in the cert
    # served, rather than cnnic.net.cn as presented in README
    "$SOURCE_DIR/../Mac/test/test-url.sh" \
      https://www.cnnic.cn/ \
      https://evdemo.cnnic.cn/ \
      https://wacc.n.shifen.com/ \
      https://mail.ztgame.com/ \
      https://211.146.10.133/
}

extended() {
    "$SOURCE_DIR/../Mac/test/test-url.sh" \
      https://cstest.cfca.com.cn/ \
      https://cs.cfca.com.cn/ \
      https://www.sheca.com/ \
      https://ibanks.bankofshanghai.com/
}

all() {
    "$SOURCE_DIR/../Mac/test/test-url.sh" \
      https://www.wosign.com/
}

echo "---------------------"
echo "Beginning base tests."
echo "---------------------"
base
echo "-------------------------"
echo "Beginning extended tests."
echo "-------------------------"
extended
echo "--------------------"
echo "Beginning all tests."
echo "--------------------"
all
echo "-------------------"
echo "All tests executed."
