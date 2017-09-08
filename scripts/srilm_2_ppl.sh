#! /bin/bash 
###########################################
#
###########################################

# constants
baseDir=$(cd `dirname "$0"`;pwd)
# functions

# main 
[ -z "${BASH_SOURCE[0]}" -o "${BASH_SOURCE[0]}" = "$0" ] || return
cd $baseDir/..
source tools/env.sh
ngram -ppl tmp/corpus/iqa.ngram-corpus.test \
    -lm tmp/corpus/iqa.ngram-corpus.lm3 \
    -debug 5 \
    -order 3 \
