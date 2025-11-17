#!/bin/bash
set -e

datasets="nq triviaqa popqa hotpotqa rerank asqa qampari narrativeqa infbenchqa infbenchmc infbenchsum lexsum trecc trecf nlu banking clinc"
lambdas="0.02 0.028 0.04 0.057 0.08 0.16 0.32 0.64 1.28 2.56"
thresholds="0.1"

for dataset in $datasets; do
  for lambda in $lambdas; do
    for threshold in $thresholds; do
      python eval.py \
        --config configs/extra/${dataset}_32k.yaml \
        --seed 42 \
        --model_name_or_path meta-llama/Llama-3.2-1B-Instruct \
        --output_dir output/llama-3.2-1b/${dataset}_32k/${lambda}-${threshold} \
        --use_filtering \
        --filtering_path weights/llama-3.2-1b-${lambda}.pt \
        --g_threshold ${threshold} \
        --max_tokens_per_head 65536
    done
  done
done
