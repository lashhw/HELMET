#!/bin/bash
set -e

datasets="nq triviaqa popqa hotpotqa rerank narrativeqa infbenchqa infbenchmc infbenchsum lexsum trecf nlu banking clinc"
lambda=$1
threshold=0.1
budgets=$2

for dataset in $datasets; do
  for budget in $budgets; do
    python eval.py \
      --config configs/extra/${dataset}_32k.yaml \
      --seed 42 \
      --model_name_or_path meta-llama/Llama-3.1-8B-Instruct \
      --output_dir output/llama-3.1-8b/${dataset}_32k/${lambda}-${threshold}-quest-${budget} \
      --use_filtering \
      --filtering_path weights/llama-3.1-8b-instruct-${lambda}.pt \
      --g_threshold ${threshold} \
      --max_tokens_per_head 40000 \
      --use_quest \
      --quest_token_budget ${budget}
  done
done
