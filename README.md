# n-grams-get-started

![](https://camo.githubusercontent.com/ae91a5698ad80d3fe8e0eb5a4c6ee7170e088a7d/687474703a2f2f37786b6571692e636f6d312e7a302e676c622e636c6f7564646e2e636f6d2f61692f53637265656e25323053686f74253230323031372d30342d30342532306174253230382e32302e3437253230504d2e706e67)

# Welcome
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
scripts/install_srilm.sh # verified on Mac OSX and Ubuntu 16.04
source tools/env.sh
```

## Corpus

corpus/iqa.ngram.vocab 词汇
corpus/iqa.ngram.valid 验证: fit hyper params
corpus/iqa.ngram.train 训练: train language models
corpus/iqa.ngram.test 测试: evaluate language models

## Train

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
        p( </s> | 否定 ...)     = [3gram] 0.029511 [ -1.53002 ]
1 sentences, 58 words, 0 OOVs
0 zeroprobs, logprob= -111.2 ppl= 76.6906 ppl1= 82.649
58 words, rank1= 0.206897 rank5= 0.37931 rank10= 0.534483
59 words+sents, rank1wSent= 0.20339 rank5wSent= 0.389831 rank10wSent= 0.542373 qloss= 0.91776 absloss= 0.900032
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


