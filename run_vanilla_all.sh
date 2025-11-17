#!/bin/bash
set -e

datasets="nq triviaqa popqa hotpotqa rerank asqa qampari narrativeqa infbenchqa infbenchmc infbenchsum lexsum trecc trecf nlu banking clinc"

for dataset in $datasets; do
  python eval.py \
    --config configs/extra/${dataset}_32k.yaml \
    --seed 42 \
    --model_name_or_path meta-llama/Llama-3.2-1B-Instruct \
    --output_dir output/llama-3.2-1b/${dataset}_32k/vanilla
done
