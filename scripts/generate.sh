#! /bin/bash

scripts=$(dirname "$0")
base=$(realpath $scripts/..)

models=$base/models
data=$base/data
tools=$base/tools
samples=$base/samples

mkdir -p $samples

num_threads=6
device=""

# Accept arguments for the model checkpoint and output file
model_checkpoint=$(realpath "$1")
output_file=$(realpath "$2")

# Check if the model checkpoint exists
if [ ! -f "$model_checkpoint" ]; then
    echo "Error: Model checkpoint file '$model_checkpoint' not found!"
    exit 1
fi

echo "Model checkpoint: $model_checkpoint"
echo "Output file: $output_file"

(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python generate.py \
        --data $data/dune \
        --words 100 \
        --checkpoint $model_checkpoint \
        --outf $output_file
)