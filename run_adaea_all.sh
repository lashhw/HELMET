#!/bin/bash
set -e

datasets="nq triviaqa popqa hotpotqa rerank narrativeqa infbenchqa infbenchmc infbenchsum lexsum trecf nlu banking clinc"
sparsitys="0.95 0.9 0.8 0.7 0.6 0.5 0.4 0.3 0.2 0.1"

for dataset in $datasets; do
  for sparsity in $sparsitys; do
    python eval.py \
      --config configs/extra/${dataset}_32k.yaml \
      --seed 42 \
      --model_name_or_path meta-llama/Llama-3.1-8B-Instruct \
      --output_dir output/llama-3.1-8b/${dataset}_32k/adaea-${sparsity} \
      --use_adaea \
      --adaea_threshold_path weights/adaea/llama-3.1-8b/${sparsity}_threshold.tsv \
      --adaea_query_stats_path weights/adaea/llama-3.1-8b/query_stats.pt \
      --max_tokens_per_head 40000
  done
done
