#キー配置変更
xmodmap .xmodmaprc

PATH=$PATH:/opt/pysh/bin
PATH=$PATH:/usr/include/python3.4m
PATH=$PATH:/usr/lib/llvm-3.5/bin
CPATH=/usr/local/lib/python3.4/dist-packages/PyUblas-2013.1-py3.4-linux-x86_64.egg/pyublas/include/:/usr/include/python3.4:/usr/local/lib/python3.4/dist-packages/numpy/core/include:/usr/lib/llvm-3.5/include:/usr/lib/llvm-3.5/include/llvm:/usr/lib/llvm-3.5/include/llvm-c
export CPATH

LD_LIBRARY_PATH=/usr/local/lib:/opt/boost_1_55_0/stage/lib:/usr/local/bin/:/usr/include/python3.4:/usr/lib/llvm-3.5/lib
export LD_LIBRARY_PATH
export PATH
export LLVM_CONFIG=/usr/lib/llvm-3.5/bin/llvm-config

