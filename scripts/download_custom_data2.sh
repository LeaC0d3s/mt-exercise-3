#! /bin/bash

scripts=`dirname "$0"`
base=$scripts/..

data=$base/data

mkdir -p $data

tools=$base/tools

# link default training data for easier access

mkdir -p $data/wikitext-2

for corpus in train valid test; do
    absolute_path=$(realpath $tools/pytorch-examples/word_language_model/data/wikitext-2/$corpus.txt)
    ln -snf $absolute_path $data/wikitext-2/$corpus.txt
done

# download a different interesting data set!

mkdir -p $data/Emma

mkdir -p $data/Emma/raw

wget https://www.gutenberg.org/files/158/158-0.txt
mv 158-0.txt $data/Emma/raw/tales.txt

# preprocess slightly

cat $data/Emma/raw/tales.txt | python $base/scripts/preprocess_raw.py > $data/Emma/raw/tales.cleaned.txt

# tokenize, fix vocabulary upper bound

cat $data/Emma/raw/tales.cleaned.txt | python $base/scripts/preprocess.py --vocab-size 5000 --tokenize --lang "en" --sent-tokenize > \
    $data/Emma/raw/tales.preprocessed.txt

# split into train, valid and test

head -n 440 $data/Emma/raw/tales.preprocessed.txt | tail -n 400 > $data/Emma/valid.txt
head -n 840 $data/Emma/raw/tales.preprocessed.txt | tail -n 400 > $data/Emma/test.txt
tail -n 3075 $data/Emma/raw/tales.preprocessed.txt | head -n 2955 > $data/Emma/train.txt
