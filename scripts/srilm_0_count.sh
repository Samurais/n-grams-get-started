#! /bin/bash 
###########################################
#
###########################################

# constants
baseDir=$(cd `dirname "$0"`;pwd)
ORDER=3
## corpus
VOCAB_FILE=corpus/iqa.ngram.vocab
TRAIN_FILE=corpus/iqa.ngram.train
TEST_FILE=corpus/iqa.ngram.test

## models
COUNT_FILE=tmp/iqa.ngram.count$ORDER
LM_FILE=tmp/iqa.ngram.lm$ORDER

# functions

# main 
[ -z "${BASH_SOURCE[0]}" -o "${BASH_SOURCE[0]}" = "$0" ] || return
cd $baseDir/..
source tools/env.sh

if [ ! -d tmp ]; then
    mkdir tmp
fi

if [ -f $COUNT_FILE ]; then
    rm $COUNT_FILE
fi

ngram-count -vocab $VOCAB_FILE \
    -debug 5 \
    -text $TRAIN_FILE \
    -order $ORDER \
    -write $COUNT_FILE \
    -unk \
