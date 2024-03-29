.PHONY: deps compile test

default: deps compile test

format:
	scripts/fnlfmt.sh

deps:
	deps/aniseed/scripts/dep.sh Olical aniseed origin/master
	deps/aniseed/scripts/dep.sh katawful katcros-fnl origin/main

compile:
	rm -rf lua/katdotnvim
	# compile fennel directly with fennel compiler
	./fennel --compile ./colors/kat.nvim.fnl >./colors/kat.nvim.lua
	./fennel --compile ./colors/kat.nwim.fnl >./colors/kat.nwim.lua
	# Remove this if you only want Aniseed at compile time.
	deps/aniseed/scripts/embed.sh aniseed katdotnvim
	deps/aniseed/scripts/embed.sh katcros-fnl katdotnvim
	deps/aniseed/scripts/compile.sh
	scripts/render.sh
	ANISEED_EMBED_PREFIX=katdotnvim deps/aniseed/scripts/compile.sh

test:
	# rm -rf test/lua
	deps/aniseed/scripts/test.sh
