# RevokeChinaCerts All shell(Mac)
# Revoke China Certificates.
# 
# Author: Chengr28
# 

#!/usr/bin/env bash
security trust-settings-import -d Trust_Settings_All.plist
