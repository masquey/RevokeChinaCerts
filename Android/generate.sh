#!/bin/sh

set -e

if [ ${1:-extended} = 'all' ];then
    echo "Generating ALL CRL set"
    # TODO: Explicitly distinguish between CA & EE certificates.
    CA_CERTS=`ls ../Windows/Certs/*.crt`
    EE_CERTS=`ls ../Windows/Certs/\[Fake\]*.crt`
    echo "all"
elif [ ${1:-extended} = 'extended' ];then
    echo "Generating EXTENDED CRL set"
    CA_CERTS=`ls ../Windows/Certs/CNNIC_*.crt ../Windows/Certs/China_Internet_Network_Information_Center_EV_Certificates_Root.crt ../Windows/Certs/[Suspicious]WaccBaiduCom.crt ../Windows/Certs/GiantRootCA.crt ../Windows/Certs/CFCA_*.crt  ../Windows/Certs/UCA_*.crt  ../Windows/Certs/[Suspicious]GoAgent_CA.crt`
    EE_CERTS=`ls ../Windows/Certs/\[Fake\]*.crt`
else
    echo "Generating Basic CRL set"
    CA_CERTS=`ls ../Windows/Certs/CNNIC_*.crt ../Windows/Certs/China_Internet_Network_Information_Center_EV_Certificates_Root.crt ../Windows/Certs/[Suspicious]WaccBaiduCom.crt ../Windows/Certs/GiantRootCA.crt`
    EE_CERTS=`ls ../Windows/Certs/\[Fake\]*.crt`
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
