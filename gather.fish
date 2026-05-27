#!/bin/fish

set tasks \
    nq triviaqa popqa hotpotqa \
    rerank \
    narrativeqa infbenchqa infbenchmc \
    infbenchsum lexsum \
    trecc trecf nlu banking clinc

for task in $tasks
    set -l pattern ".json.score"
    set -l filter ""

    switch $task
        case nq triviaqa popqa hotpotqa
            set filter '[.["input_len"], .["substring_exact_match"]]'

        case rerank
            set filter '[.["input_len"], .["NDCG@10"]]'

        case narrativeqa
            set pattern "-gpt4eval_o.json"
            set filter '.["averaged_metrics"] | [.["input_len"], .["gpt-4-score"]]'
        
        case infbenchqa
            set filter '[.["input_len"], .["rougeL_f1"]]'

        case infbenchsum lexsum
            set pattern "-gpt4eval_o.json"
            set filter '.["averaged_metrics"] | [.["input_len"], .["gpt-4-recall"], .["gpt-4-precision"], .["gpt-4-f1"]]'

        case infbenchmc trecc trecf nlu banking clinc
            set filter '[.["input_len"], .["exact_match"]]'

        case '*'
            echo "Error: No metric defined for task $task" >&2
            continue
    end

    for f in {$task}*/*/*{$pattern}
        printf '%s\t' (dirname $f)
        jq -r "$filter | @tsv" $f
    end | sort
end
