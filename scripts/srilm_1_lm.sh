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
if [ -f $LM_FILE ]; then
    rm $LM_FILE
fi
ngram-count -vocab $VOCAB_FILE \
    -debug 5 \
    -order $ORDER \
    -read $COUNT_FILE \
    -lm $LM_FILE \
    -gt1min 3 -gt1max 7 \
    -gt2min 3 -gt2max 7 \
    -gt3min 3 -gt3max 7 \
