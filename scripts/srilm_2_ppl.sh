#! /bin/bash 
###########################################
#
###########################################

# constants
baseDir=$(cd `dirname "$0"`;pwd)
. $baseDir/srilm_0_count.sh
# functions

# main 
[ -z "${BASH_SOURCE[0]}" -o "${BASH_SOURCE[0]}" = "$0" ] || return
cd $baseDir/..
source tools/env.sh
ngram -ppl $TEST_FILE \
    -lm $LM_FILE \
    -debug 5 \
    -order $ORDER \
