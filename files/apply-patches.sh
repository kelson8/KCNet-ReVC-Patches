#!/bin/bash
# https://serverfault.com/a/784560

shopt -s globstar
#for file in ./patch/*.patch

# TODO Fix this, this almost works but needs worked on.
for file in ./patches/patch/*.patch
do
    patch -p1 < "$file"
done
