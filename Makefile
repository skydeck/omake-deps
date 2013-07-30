.PHONY: default
default: omake-deps

omake-deps: omake_deps.ml
	ocamlopt -o omake-deps -g -annot str.cmxa omake_deps.ml

.PHONY: test
test: omake-deps
	./omake-deps < sample-dependencies.in > sample-dependencies.om

.PHONY: install
install:
	cp omake-deps $(OCAML_BASE)/bin

.PHONY: clean
clean:
	rm -f *.cm* *.o *.annot *~
	rm -f omake-deps sample-dependencies.om
