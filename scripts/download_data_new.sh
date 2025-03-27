#! /bin/bash

scripts=$(dirname "$0")
base=$scripts/..

data=$base/data

dir_name=dune

mkdir -p $data

tools=$base/tools   

# download a different interesting data set!

mkdir -p $data/dune

mkdir -p $data/dune/raw

#wget https://www.gutenberg.org/files/52521/52521-0.txt
#mv 52521-0.txt $data/grimm/raw/tales.txt

cp /dune_full.txt $data/dune/raw/dune_full.txt

# preprocess slightly

cat $data/dune/raw/dune_full.txt | python $base/scripts/preprocess_raw.py > $data/dune/raw/dune_full.cleaned.txt

# tokenize, fix vocabulary upper bound

cat $data/dune/raw/dune_full.cleaned.txt | python $base/scripts/preprocess.py --vocab-size 10000 --tokenize --lang "en" --sent-tokenize > \
    $data/dune/raw/dune_full.preprocessed.txt

# split into train, valid and test

head -n 440 $data/dune/raw/dune_full.preprocessed.txt | tail -n 400 > $data/dune/valid.txt
head -n 840 $data/dune/raw/dune_full.preprocessed.txt | tail -n 400 > $data/dune/test.txt
tail -n 3075 $data/dune/raw/dune_full.preprocessed.txt | head -n 2955 > $data/dune/train.txt
