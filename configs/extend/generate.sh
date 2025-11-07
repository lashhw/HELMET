#!/bin/bash
python filter_config.py -i ../rag_short.yaml -o rag_8k.yaml -x 0 4 8 12
python filter_config.py -i ../rag_short.yaml -o rag_16k.yaml -x 1 5 9 13
python filter_config.py -i ../rag_short.yaml -o rag_32k.yaml -x 2 6 10 14
python filter_config.py -i ../rag_short.yaml -o rag_64k.yaml -x 3 7 11 15
python filter_config.py -i ../summ_short.yaml -o lexsum_32k.yaml -x 6
python filter_config.py -i ../rag_short.yaml -o nq_32k.yaml -x 2