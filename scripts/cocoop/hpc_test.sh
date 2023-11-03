#!/bin/bash

#SBATCH --job-name=cocoop-train-test-class
#SBATCH --output=cocoop-train-test-class.out
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --gres=gpu:1
#SBATCH --time=36:00:00
#SBATCH --mem=64G
#SBATCH -C RTX8000

DATASET=caltech101
for seed in {1..3} do
    echo "seed ${seed}"
    sbatch --export=DATASET=${DATASET},SEED=${seed} base2new_test.sh
done