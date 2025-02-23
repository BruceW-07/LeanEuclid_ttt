DeepSeek-R1_statement_5shot:
	lake script run cleanup
	rm -rf result/
	python3 AutoFormalization/statement/autoformalize.py --dataset Book --category "" --reasoning text-only --num_query 1 --num_examples 5 --model DeepSeek-R1
	python3 AutoFormalization/statement/evaluate.py --dataset Book --category "" --reasoning text-only --num_examples 5 > result/accuracy.txt
	zip -r $@.zip result/ tmp/

DeepSeek-R1_statement_5shot_3query:
	lake script run cleanup
	rm -rf result/
	python3 AutoFormalization/statement/autoformalize.py --dataset Book --category "" --reasoning text-only --num_query 3 --num_examples 5 --model DeepSeek-R1
	python3 AutoFormalization/statement/evaluate.py --dataset Book --category "" --reasoning text-only --num_examples 5 > result/accuracy.txt
	zip -r $@.zip result/ tmp/


Qwen2.5-72B-Instruct_statement_5shot: 
	lake script run cleanup
	rm -rf result/
	python3 AutoFormalization/statement/autoformalize.py --dataset Book --category "" --reasoning text-only --num_query 1 --num_examples 5 --model Qwen2.5-72B-Instruct
	python3 AutoFormalization/statement/evaluate.py --dataset Book --category "" --reasoning text-only --num_examples 5 > result/accuracy.txt
	zip -r $@.zip result/ tmp/

GPT-4_statement_5shot: 
	lake script run cleanup
	rm -rf result/
	python3 AutoFormalization/statement/autoformalize.py --dataset Book --category "" --reasoning text-only --num_query 1 --num_examples 5 --model gpt-4
	python3 AutoFormalization/statement/evaluate.py --dataset Book --category "" --reasoning text-only --num_examples 5 > result/accuracy.txt
	zip -r $@.zip result/ tmp/


.PHONY: DeepSeek-R1_statement_5shot Qwen/Qwen2.5-72B-Instruct_statement_5shot GPT-4_statement_5shot