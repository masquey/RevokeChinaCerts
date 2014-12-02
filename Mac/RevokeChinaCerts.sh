# RevokeChinaCerts Mac shell
# Revoke China Certificates.
# 
# Author: QuantumGhost
# 

#!/usr/bin/env bash
security trust-settings-import -d Trust_Settings.plist
