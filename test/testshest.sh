#!/bin/bash
source ../shest.sh

get_context_location test_that
test_that A = A B = B C = C 3 -gt 2 8 -ge 0 8 == 78
confirm_exit_status
echo HELLOOOOOO
confirm_exit_status 1
xtest_that B = A
xtest_that B = A C = D 9 -gt 3
xconfirm_exit_status
get_context_location test_that
echo Hello
confirm_exit_status
