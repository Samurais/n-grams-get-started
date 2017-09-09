# n-grams-get-started

N-gram介绍:
http://blog.csdn.net/lengyuhong/article/details/6022053

Ngram语言模型: 
https://flystarhe.github.io/2016/08/16/ngram/

## N-gram应用
Google N-grams Downloader:
http://blog.csdn.net/liweibin1994/article/details/77387485

n元模型与word2vec
http://xiaosheng.me/2017/06/08/article69/

## Install tools

### srilm
Download [srilm toolkit](http://www.speech.sri.com/projects/srilm/) 1.7.0 to ```downloads/srilm-1.7.0.tgz```.

```
scripts/install_srilm.sh
source tools/env.sh
```

## Train
下载语料文件: https://pan.baidu.com/s/1qYDgKvM，放在 tmp/corpus 文件夹下。

### Count File

```
$ ./scripts/srilm_0_count.sh # almost run 5seconds on my laptop, i5 cpu, 8GB mem.
corpus/iqa.ngram.train: line 39445: 39445 sentences, 2.16426e+06 words, 0 OOVs
0 zeroprobs, logprob= 0 ppl= 1 ppl1= 1
```

### Language Model

```
$ ./scripts/srilm_1_lm.sh # almost run 5mins on my laptop, i5 cpu, 8GB mem.
CONTEXT 此 支付 numerator 0.389585 denominator 0.988694 BOW -0.404459
CONTEXT 此 是 numerator 0.383682 denominator 0.887665 BOW -0.364277
CONTEXT 此 找到 numerator 0.389585 denominator 0.942731 BOW -0.383785
CONTEXT 此 具有 numerator 0.325904 denominator 0.935851 BOW -0.458116
writing 24999 1-grams
writing 113392 2-grams
writing 98471 3-grams
```

### Calculate perplexity for test data 

```
$ ./scripts/srilm_2_ppl.sh
reading 24999 1-grams
reading 522852 2-grams
reading 1337703 3-grams
我们 什么 时候 要有 健康 保险
        p( 我们 | <s> )         = [2gram] 0.00305013 [ -2.51568 ]
        p( 什么 | 我们 ...)     = [2gram] 2.51044e-07 [ -6.60025 ]
        p( 时候 | 什么 ...)     = [3gram] 0.989583 [ -0.00454763 ]
        p( <unk> | 时候 ...)    = [OOV] 0 [ -inf ]
        p( 健康 | <unk> ...)    = [1gram] 0.00365603 [ -2.43699 ]
        p( 保险 | 健康 ...)     = [2gram] 0.517352 [ -0.286214 ]
        p( </s> | 保险 ...)     = [3gram] 0.00889128 [ -2.05104 ]
1 sentences, 6 words, 1 OOVs
0 zeroprobs, logprob= -13.8947 ppl= 206.912 ppl1= 601.096
6 words, rank1= 0.333333 rank5= 0.333333 rank10= 0.333333
7 words+sents, rank1wSent= 0.285714 rank5wSent= 0.285714 rank10wSent= 0.285714 qloss= 0.774778 absloss= 0.639638

file tmp/corpus/iqa.ngram-corpus.test: 1 sentences, 6 words, 1 OOVs
0 zeroprobs, logprob= -13.8947 ppl= 206.912 ppl1= 601.096
6 words, rank1= 0.333333 rank5= 0.333333 rank10= 0.333333
7 words+sents, rank1wSent= 0.285714 rank5wSent= 0.285714 rank10wSent= 0.285714 qloss= 0.774778 absloss= 0.639638
```

## Trouble Shotting

### pysrilm[not work in Mac OSX]
```
cd tools/pysrilm
source ~/venv-py2/bin/activate # use py2
pip install cython
python setup.py install
```

1. clang: error: unsupported option '-fopenmp' on Mac OSX
https://github.com/ppwwyyxx/OpenPano/issues/16
```
brew install gcc --without-multilib
export CXX=/usr/local/Cellar/gcc/7.2.0/bin/g++-7
```


