# ocamlopt-afl

Fuzz testing OCaml's native-code compiler using [American fuzzy
lop](http://lcamtuf.coredump.cx/afl/)(afl).

## Install

  1. [Install afl](http://lcamtuf.coredump.cx/afl/).
  2. Install afl instrumented OCaml.

         $ opam remote add ocamllabs -k git https://github.com/ocamllabs/opam-repo-dev
         $ opam switch 4.02.3+afl

## Running

Make sure `afl-fuzz` is in your path. In order to fuzz test the instrumented
compiler, just run

    ./fuzz-test.sh

Fuzz testing can also be done in parallel.

    ./fuzz-test.sh 8

starts 8 fuzzers, 7 of which run as background processes, appending their
outputs to `fuzz<N>.log`. 

The fuzzers periodically synchronize their findings, but the number of crashes 
displayed in the UI is only from the fuzzer running in the foreground. The total 
number of crashes so far across all of the fuzzers is given by:

    find out -name "id*" | grep "crashes" | wc -l

Running `./gather-results.sh` collects all of the crashing testcases in a tar ball, and
`clean-temp.sh` removes temporary files.
