#!/bin/bash


nvim --headless -u NONE \
    -c "let &runtimepath = &runtimepath . ',deps/aniseed,' . getcwd()" \
    -c "lua package.path = package.path .. ';$(pwd)/lua/?.lua;deps/aniseed/lua/?.lua'" \
    -c "lua require('katdotnvim.utils.json.write').colors('/home/kat/Git Repos/katdotnvim/json')" \
    +q
