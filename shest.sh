#!/bin/bash

RED='\033[0;31m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
NC='\033[0m' # No Color

export EXITSTATUS=0

test_that() {
  if [ $1 $2 $3 ]; then
    printf "$1 $2 $3 ${GREEN}PASSED${NC}\n"
  else
    printf "$1 $2 $3 ${RED}FAILED${NC}\n"
    unset EXITSTATUS
    export EXITSTATUS=1
  fi
}

xtest_that() {
  printf "$1 $2 $3 ${BLUE}PENDING${NC}\n"
}

confirm_exit_status() {
  PREVEXIT=$?
  EXPECTED="0"
  if [[ ! -z "$1" ]]; then
    printf "Overriding Default Exit Status\n"
    unset EXPECTED
    EXPECTED=$1
  fi
  if [[ $PREVEXIT != $EXPECTED ]]; then
    export EXITSTATUS=1
    printf "Previous Exit Code: $PREVEXIT ${RED}FAILED${NC}\n"
  else
    printf "Previous Exit Code: $PREVEXIT ${GREEN}PASSED${NC}\n"
  fi
}

test_that hello == hello
test_that hello == hell
xtest_that hello == hello
test_that $(wc -l ./shest.sh | awk '{print $1}') -gt 0
test_that $(wc -l ./shest.sh | awk '{print $1}') -lt 0

curl www.sldfs.sdfa
confirm_exit_status
exit $EXITSTATUS
