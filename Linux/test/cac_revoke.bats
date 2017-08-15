#!/usr/bin/env bats

runner() {
  local shell=${SH:-sh}
  run "$shell" ../cac_revoke.sh "$@"
}

readonly Cnnic='mozilla/CNNIC_ROOT.crt'
readonly Cnnic_ev='mozilla/China_Internet_Network_Information_Center_EV_Certificates_Root.crt'
readonly Cfca_ev='mozilla/CFCA_EV_ROOT.crt'
readonly Wosign_cn='mozilla/WoSign_China.crt'
readonly Wosign='mozilla/WoSign.crt'
readonly Hk_post='mozilla/Hongkong_Post_Root_CA_1.crt'
readonly Epki='mozilla/ePKI_Root_Certification_Authority.crt'
readonly Tw_grca='mozilla/Taiwan_GRCA.crt'
readonly Twca='mozilla/TWCA_Root_Certification_Authority.crt'
readonly Twca_global='mozilla/TWCA_Global_Root_CA.crt'

readonly to_test='fixtures/ca-certificates.conf'
readonly orig='fixtures/ca-certificates.conf.orig'
readonly to_restore='fixtures/ca-certificates.conf.torestore'

compare_one_line() {
  diff -u $orig $to_test | grep --quiet --extended-regexp -e "$1"
}

compare_lines() {
  local deleted="$1"
  local added="$2"
  shift 2
  local i
  for i in "$@"; do
    compare_one_line "$deleted$i"
    compare_one_line "$added$i"
  done
}

compare() {
  compare_lines '-' '\+!' "$@"
}

compare_restore() {
  compare_lines '-!' '\+' "$@"
}

compare_base() {
  compare $Cnnic $Cnnic_ev
}

compare_extended() {
  compare_base

  compare $Cfca_ev $Wosign_cn $Wosign
}

compare_all() {
  compare_extended

  compare $Hk_post $Epki $Tw_grca $Twca $Twca_global
}

setup() {
  cp $orig $to_test
}


@test "No arguments prints usage instructions." {
  runner
  [ $status -eq 1 ]
  [ $output = "Usage: [sudo] cac_revoke base|extended|all|restore" ]
}

@test "More than 2 arguments prints usage instructions." {
  runner 1 2 3
  [ $status -eq 1 ]
  [ $output = "Usage: [sudo] cac_revoke base|extended|all|restore" ]
}

@test "Second argument not --debug prints usage instructions." {
  runner 1 2
  [ $status -eq 1 ]
  [ $output = "Usage: [sudo] cac_revoke base|extended|all|restore" ]
}

@test "First argument is not one of base, extended, all or restore." {
  runner random_text --debug
  [ $status -eq 1 ]
  [ $output = "Usage: [sudo] cac_revoke base|extended|all|restore" ]
}

@test "base" {
  runner base --debug
  [ $status -eq 0 ]
  compare_base
}

@test "extended" {
  runner extended --debug
  [ $status -eq 0 ]
  compare_extended
}


@test "all" {
  runner all --debug
  [ $status -eq 0 ]
  compare_all
}


@test "restore" {
  cp $to_restore $to_test
  runner restore --debug
  [ $status -eq 0 ]
  diff --brief $orig $to_test
}

