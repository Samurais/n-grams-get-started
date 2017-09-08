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
ngram-count -vocab tmp/corpus/iqa.ngram-vocab \
    -debug 5 \
    -text tmp/corpus/iqa.ngram-corpus \
    -order 3 \
    -write tmp/corpus/iqa.ngram-corpus.count3 \
    -unk \
