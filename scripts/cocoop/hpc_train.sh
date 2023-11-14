#!/bin/bash

DATASET=imagenet
for seed in {1..3}; do
    echo "seed ${seed}"
    sbatch --gres=gpu:rtx8000:1 -N 1 -n 1 --ntasks-per-node=1 --cpus-per-task=8 \
        --job-name=cocoop-test-class --output=cocoop-train-class.out \
        --mem=64G --time=36:00:00 base2new_train.sh ${DATASET} ${seed} 
done