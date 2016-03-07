#!/bin/bash

num_fuzzers=1
if [[ $# -eq 1 ]]
then
	let num_fuzzers=$1
fi

i=1
while [[ $i -lt ${num_fuzzers} ]]; do
	echo "Starting fuzzer $i. Output logged to fuzz$i.log."
	afl-fuzz -m 1024 -t 1000 -x dict/ocaml.dict -i inp -o out -f test$i.ml -S fuzzer$i ocamlopt.opt -o test$i @@ &> fuzz$i.log &
	let i+=1
done


echo "Starting fuzzer 0.."
afl-fuzz -m 1024 -t 1000 -x dict/ocaml.dict -i inp -o out -f test0.ml -S fuzzer0 ocamlopt.opt -o test0 @@
