for shell in dash bash mksh 'busybox sh'; do
  echo "Testing in $shell..."
  export SH="$shell"
  bats cac_revoke.bats
  echo
  echo "End testing in $shell."
  echo
done
