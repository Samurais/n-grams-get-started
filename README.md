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

### pysrilm
```
cd tools/pysrilm
source ~/venv-py2/bin/activate # use py2
pip install cython
python setup.py install
```

## Train
下载语料文件: https://pan.baidu.com/s/1qYDgKvM，放在 tmp/corpus 文件夹下。

### Count File

```
$ ./scripts/srilm_0_count.sh
tmp/corpus/iqa.ngram-corpus: line 2612014: 2.61201e+06 sentences, 3.33705e+08 words, 0 OOVs
0 zeroprobs, logprob= 0 ppl= 1 ppl1= 1
```

### Language Model

```
$ ./scripts/srilm_1_lm.sh

```

## Trouble Shotting

1. clang: error: unsupported option '-fopenmp' on Mac OSX
https://github.com/ppwwyyxx/OpenPano/issues/16
```
brew install gcc --without-multilib
export CXX=/usr/local/Cellar/gcc/7.2.0/bin/g++-7

```


