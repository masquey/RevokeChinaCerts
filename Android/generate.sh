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

echo "Generating Configurations"
# Generate a blacklist of CA cert public keys
PUBKEYS=`bash ca-blacklist.sh ${CA_CERTS} | tr '\n' ','`
# Generate a blacklist of EE cert serial numbers
SERIALS=`bash ee-blacklist.sh ${EE_CERTS} | tr '\n' ','`

echo "Writing Configurations"
echo $PUBKEYS > pubkey_blacklist.txt
echo $SERIALS > serial_blacklist.txt

echo "Generated and saved to pubkey_blacklist.txt and serial_blacklist.txt"

echo "Building Flashable Zip"
bash flashable.sh

echo "Done!"
