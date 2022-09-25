#!/bin/bash

for i in $(find 'fnl/katdotnvim/' -name "*.fnl"); do
  fnlfmt --fix "$i"
done;
for i in $(find 'test/fnl/katdotnvim/' -name "*.fnl"); do
  fnlfmt --fix "$i"
done;
echo "Done formatting with fnlfmt"
