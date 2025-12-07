#!/bin/bash
set -e

datasets="nq triviaqa popqa hotpotqa rerank narrativeqa infbenchqa infbenchmc infbenchsum lexsum trecf nlu banking clinc"
sparsitys="0.9 0.8 0.7 0.6 0.5 0.4 0.3 0.2 0.1"

for dataset in $datasets; do
  for sparsity in $sparsitys; do
    python eval.py \
      --config configs/extra/${dataset}_32k.yaml \
      --seed 42 \
      --model_name_or_path meta-llama/Llama-3.1-8B-Instruct \
      --output_dir output/llama-3.1-8b/${dataset}_32k/duo-iclr-${sparsity} \
      --use_duo_attn \
      --duo_attn_pattern_dir duo_attn/attn_patterns/Meta-Llama-3.1-8B-Instruct/lr=0.02-reg=0.05-ctx=1000_128000-multi_passkey10 \
      --duo_attn_sparsity ${sparsity} \
      --max_tokens_per_head 40000
  done
done
