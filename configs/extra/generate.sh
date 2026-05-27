#!/bin/bash
python filter_config.py -i ../rag_short.yaml -o rag_8k.yaml -x 0 4 8 12
python filter_config.py -i ../rag_short.yaml -o rag_16k.yaml -x 1 5 9 13
python filter_config.py -i ../rag_short.yaml -o rag_32k.yaml -x 2 6 10 14
python filter_config.py -i ../rag_short.yaml -o rag_64k.yaml -x 3 7 11 15
python filter_config.py -i ../rag_short.yaml -o nq_32k.yaml -x 2
python filter_config.py -i ../rag_short.yaml -o triviaqa_32k.yaml -x 6
python filter_config.py -i ../rag_short.yaml -o hotpotqa_32k.yaml -x 10
python filter_config.py -i ../rag_short.yaml -o popqa_32k.yaml -x 14
python filter_config.py -i ../rerank_short.yaml -o rerank_32k.yaml -x 2
python filter_config.py -i ../cite_short.yaml -o asqa_32k.yaml -x 2
python filter_config.py -i ../cite_short.yaml -o qampari_32k.yaml -x 6
python filter_config.py -i ../longqa_short.yaml -o narrativeqa_32k.yaml -x 2
python filter_config.py -i ../longqa_short.yaml -o infbenchqa_32k.yaml -x 6
python filter_config.py -i ../longqa_short.yaml -o infbenchmc_32k.yaml -x 10
python filter_config.py -i ../summ_short.yaml -o infbenchsum_32k.yaml -x 2
python filter_config.py -i ../summ_short.yaml -o lexsum_32k.yaml -x 6
python filter_config.py -i ../icl_short.yaml -o trecc_32k.yaml -x 2
python filter_config.py -i ../icl_short.yaml -o trecf_32k.yaml -x 6
python filter_config.py -i ../icl_short.yaml -o banking_32k.yaml -x 10
python filter_config.py -i ../icl_short.yaml -o clinc_32k.yaml -x 14
python filter_config.py -i ../icl_short.yaml -o nlu_32k.yaml -x 18