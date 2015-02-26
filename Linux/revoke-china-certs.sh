#!/bin/sh

set -e

if [ ${1:-extended} = 'all' ];then
    echo "Generating ALL CRL set"
    # TODO: Explicitly distinguish between CA & EE certificates.
    CA_CERTS=`ls ../Windows/Certs/Online/*.crt`
    EE_CERTS=`ls ../Windows/Certs/Online/\[Fake\]*.crt`
    echo "all"
elif [ ${1:-extended} = 'extended' ];then
    echo "Generating EXTENDED CRL set"
    CA_CERTS=`ls ../Windows/Certs/Online/CNNIC_*.crt ../Windows/Certs/Online/China_Internet_Network_Information_Center_EV_Certificates_Root.crt ../Windows/Certs/Online/[Suspicious]WaccBaiduCom.crt ../Windows/Certs/Online/GiantRootCA.crt ../Windows/Certs/Online/CFCA_*.crt  ../Windows/Certs/Online/UCA_*.crt  ../Windows/Certs/Online/[Suspicious]GoAgent_CA.crt`
    EE_CERTS=`ls ../Windows/Certs/Online/\[Fake\]*.crt`
elif [ ${1:-extended} = 'restore' ];then
    echo "Generating RESTORE CRL set"
    CA_CERTS=''
    EE_CERTS=''
else
    echo "Generating Basic CRL set"
    CA_CERTS=`ls ../Windows/Certs/Online/CNNIC_*.crt ../Windows/Certs/Online/China_Internet_Network_Information_Center_EV_Certificates_Root.crt ../Windows/Certs/Online/[Suspicious]WaccBaiduCom.crt ../Windows/Certs/Online/GiantRootCA.crt`
    EE_CERTS=`ls ../Windows/Certs/Online/\[Fake\]*.crt`
fi

CERTS=`echo $CA_CERTS $EE_CERTS`
./nss_revoke.sh ${2:-~/.pki/nssdb} "${CERTS}"
