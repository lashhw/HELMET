#!/bin/bash
set -e

datasets="nq triviaqa popqa hotpotqa rerank asqa qampari narrativeqa infbenchqa infbenchmc infbenchsum lexsum trecc trecf nlu banking clinc"
sparsitys="0.9 0.8 0.7 0.6 0.5 0.4 0.3 0.2 0.1"

for dataset in $datasets; do
  for sparsity in $sparsitys; do
    python eval.py \
      --config configs/extra/${dataset}_32k.yaml \
      --seed 42 \
      --model_name_or_path meta-llama/Llama-3.2-1B-Instruct \
      --output_dir output/llama-3.2-1b/${dataset}_32k/duo-${sparsity} \
      --use_duo_attn \
      --duo_attn_pattern_dir weights/llama-3.2-1b-lr0.2-lambda0.05 \
      --duo_attn_sparsity ${sparsity} \
      --max_tokens_per_head 65536
  done
done
