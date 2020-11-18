#!/bin/bash
cd $GITHUB_WORKSPACE
git clean -dfx
git submodule init
git submodule update
cmake -DCMAKE_BUILD_TYPE=debug .
make -j2
make install
task --version

# Setup tests
cd $GITHUB_WORKSPACE/test/
make

./run_all -v 
cat all.log | grep 'not ok'
./problems
