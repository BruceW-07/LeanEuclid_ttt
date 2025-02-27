define CLEANUP
	@if [ -d "tmp" ]; then \
		lake script run cleanup; \
	fi
	rm -rf result/ conversation/
endef

define ZIP
	zip -r $@.zip result/ tmp/ conversation/
endef

DeepSeek-R1_statement_5shot:
	${CLEANUP}
	python3 AutoFormalization/statement/autoformalize.py --dataset Book --category "" --reasoning text-only --num_query 1 --num_examples 5 --model deepseek-r1-azure --max_tokens 4000
	python3 AutoFormalization/statement/evaluate.py --dataset Book --category "" --reasoning text-only --num_examples 5 > result/accuracy.txt
	${ZIP}

DeepSeek-R1_statement_5shot_5query:
	${CLEANUP}
	python3 AutoFormalization/statement/autoformalize.py --dataset Book --category "" --reasoning text-only --num_query 5 --num_examples 5 --model deepseek-r1
	python3 AutoFormalization/statement/evaluate.py --dataset Book --category "" --reasoning text-only --num_examples 5 > result/accuracy.txt
	${ZIP}

Qwen2.5-14B-Instruct_statement_5shot: 
	${CLEANUP}
	python3 AutoFormalization/statement/autoformalize.py --dataset Book --category "" --reasoning text-only --num_query 1 --num_examples 5 --model Qwen/Qwen2.5-14B-Instruct
	python3 AutoFormalization/statement/evaluate.py --dataset Book --category "" --reasoning text-only --num_examples 5 > result/accuracy.txt
	${ZIP}

Qwen2.5-32B-Instruct_statement_5shot: 
	${CLEANUP}
	python3 AutoFormalization/statement/autoformalize.py --dataset Book --category "" --reasoning text-only --num_query 1 --num_examples 5 --model Qwen/Qwen2.5-32B-Instruct
	python3 AutoFormalization/statement/evaluate.py --dataset Book --category "" --reasoning text-only --num_examples 5 > result/accuracy.txt
	${ZIP}

Qwen2.5-72B-Instruct_statement_5shot: 
	${CLEANUP}
	python3 AutoFormalization/statement/autoformalize.py --dataset Book --category "" --reasoning text-only --num_query 1 --num_examples 5 --model Qwen/Qwen2.5-72B-Instruct
	python3 AutoFormalization/statement/evaluate.py --dataset Book --category "" --reasoning text-only --num_examples 5 > result/accuracy.txt
	${ZIP}

GPT-4_statement_5shot: 
	${CLEANUP}
	python3 AutoFormalization/statement/autoformalize.py --dataset Book --category "" --reasoning text-only --num_query 1 --num_examples 5 --model gpt-4
	python3 AutoFormalization/statement/evaluate.py --dataset Book --category "" --reasoning text-only --num_examples 5 > result/accuracy.txt
	${ZIP}

GPT-4o-mini_statement_5shot: 
	${CLEANUP}
	python3 AutoFormalization/statement/autoformalize.py --dataset Book --category "" --reasoning text-only --num_query 1 --num_examples 5 --model gpt-4o-mini
	python3 AutoFormalization/statement/evaluate.py --dataset Book --category "" --reasoning text-only --num_examples 5 > result/accuracy.txt
	${ZIP}

GPT-4o-mini_statement_5shot_multi-modal: 
	${CLEANUP}
	python3 AutoFormalization/statement/autoformalize.py --dataset Book --category "" --reasoning multi-modal --num_query 1 --num_examples 5 --model gpt-4o-mini
	python3 AutoFormalization/statement/evaluate.py --dataset Book --category "" --reasoning multi-modal --num_examples 5 > result/accuracy.txt
	${ZIP}



.PHONY: DeepSeek-R1_statement_5shot Qwen/Qwen2.5-72B-Instruct_statement_5shot GPT-4_statement_5shot