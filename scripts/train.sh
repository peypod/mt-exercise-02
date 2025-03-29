#! /bin/bash

scripts=$(dirname "$0")
base=$(realpath $scripts/..)

models=$base/models
data=$base/data
tools=$base/tools

mkdir -p $models

num_threads=4
device=""

for VARIABLE in 0.0 0.25 0.5 0.75 0.9
do

    SECONDS=0

    (cd $tools/pytorch-examples/word_language_model &&
        CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python main.py --data $data/dune \
            --epochs 40 \
            --log-interval 1 \
            --emsize 200 --nhid 200 --dropout $VARIABLE --tied \
            --save $models/model.pt
    )

    echo "time taken:"
    echo "$SECONDS seconds"

done
