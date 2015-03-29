#!/bin/sh

set -e

ed_conf() {
  local regex="$1"
  sed --in-place --regexp-extended "$regex" "$Config"
}

comment() {
  ed_conf "s%^$1%!\0%g"
}

uncomment() {
  ed_conf "s%^!($1)%\1%g"
}

readonly Cnnic='mozilla/CNNIC_ROOT.crt'
readonly Cnnic_ev='mozilla/China_Internet_Network_Information_Center_EV_Certificates_Root.crt'
readonly Wosign_cn='mozilla/WoSign_China.crt'
readonly Wosign='mozilla/WoSign.crt'
readonly Hk_post='mozilla/Hongkong_Post_Root_CA_1.crt'
readonly Epki='mozilla/ePKI_Root_Certification_Authority.crt'
readonly Tw_grca='mozilla/Taiwan_GRCA.crt'
readonly Twca='mozilla/TWCA_Root_Certification_Authority.crt'
readonly Twca_global='mozilla/TWCA_Global_Root_CA.crt'

update_certs() {
  if [ "$debug" ]; then
    echo 'echo (fake) update-ca-certificates'
  else
    # In /etc/ca-certificates.conf, each line gives a pathname of a CA
    # certificate under /usr/share/ca-certificates  that should be trusted.
    # Lines that begin with "!" are deselected, causing the  deactivation
    # of the CA certificate. If a CA certificate under /usr/share/ca-certificates
    # does not have a corresponding line in /etc/ca-certificates.conf,
    # then the CA certificate will be linked into /etc/ssl/certs/name.pem,
    # but will not be include in `/etc/ssl/certs/ca-certificates.crt`.
    # Thus an OpenSSL based application will still use it (unless this
    # application only checks for `/etc/ssl/certs/ca-certificates.crt`).
    # With the option `--fresh`, the CA certificate will not be linked.
        update-ca-certificates --fresh
  fi
}

revoke_base() {
  comment $Cnnic
  comment $Cnnic_ev

  update_certs
}

revoke_extended() {
  # Same as base.
  revoke_base
}

revoke_all() {
  revoke_extended

  comment $Wosign_cn
  comment $Wosign
  comment $Hk_post
  comment $Epki
  comment $Tw_grca
  comment $Twca
  comment $Twca_global
}

restore() {
  uncomment $Cnnic
  uncomment $Cnnic_ev
  uncomment $Wosign_cn
  uncomment $Wosign
  uncomment $Hk_post
  uncomment $Epki
  uncomment $Tw_grca
  uncomment $Twca
  uncomment $Twca_global

  update_certs
}

help() {
  echo 'Usage: [sudo] cac_revoke base|extended|all|restore'
}

main() {
  # Debug.
  if [ "$2" ]; then
    if [ "$2" = '--debug' ]; then
      readonly debug='fixtures/ca-certificates.conf'
      readonly Config=${debug:-'/etc/ca-certificates.conf'}
    else
      help
      exit 1
    fi
  fi

  case $1 in
    base) revoke_base;;
    extended) revoke_extended;;
    all) revoke_all;;
    restore) restore;;
    *) help; exit 1;;
  esac
}


main "$@"
