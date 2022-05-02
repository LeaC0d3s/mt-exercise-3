#! /bin/bash

scripts=`dirname "$0"`
base=$(realpath $scripts/..)

models=$base/models
data=$base/data
tools=$base/tools
samples=$base/samples

mkdir -p $samples

num_threads=4
device=""

#(cd $tools/pytorch-examples/word_language_model &&
#    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python generate.py \
#        --data $data/Emma \
#        --words 100 \
#        --checkpoint $models/model0_0.pt \
#        --outf $samples/sample0_0
#)

#(cd $tools/pytorch-examples/word_language_model &&
#    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python generate.py \
#        --data $data/Emma \
#        --words 100 \
#        --checkpoint $models/model0_3.pt \
#        --outf $samples/sample0_3
#)

(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python generate.py \
        --data $data/Emma \
        --words 100 \
        --checkpoint $models/model0_5.pt \
        --outf $samples/sample0_5
)

#(cd $tools/pytorch-examples/word_language_model &&
#    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python generate.py \
#        --data $data/Emma \
#        --words 100 \
#        --checkpoint $models/model0_6.pt \
#        --outf $samples/sample0_6
#)

#(cd $tools/pytorch-examples/word_language_model &&
#    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python generate.py \
#        --data $data/Emma \
#        --words 100 \
#        --checkpoint $models/model0_9.pt \
#        --outf $samples/sample0_9
#)