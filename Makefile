.PHONY: deps compile test

default: deps compile test


deps:
	scripts/dep.sh Olical aniseed origin/master

compile:
	rm -rf lua/katdotnvim
	deps/aniseed/scripts/compile.sh

	# compile fennel directly with fennel compiler
	./fennel --compile ./colors/kat.nvim.fnl >./colors/kat.nvim.lua

	# Remove this if you only want Aniseed at compile time.
	deps/aniseed/scripts/embed.sh aniseed katdotnvim

test:
	rm -rf test/lua
	deps/aniseed/scripts/test.sh
