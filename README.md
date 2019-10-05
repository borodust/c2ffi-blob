# C2FFI-BLOB

Precompiled `c2ffi` executables for various platforms to use with `:claw`
project.

## Dependencies
For GNU\Linux you would need to have `libstdc++` installed.

## CMake
```sh
CC=/opt/bodge/llvm8/bin/clang \
CXX=/opt/bodge/llvm8/bin/clang++ \
LLVM_DIR=/opt/bodge/llvm8/ \
cmake -DCMAKE_BUILD_TYPE=Release ..\
&& cmake --build .
```

## LLVM 8 Preparations
```sh
git clone --depth=1 https://github.com/llvm/llvm-project \
&& cd llvm-project/llvm/ \
&& cp -R ../clang tools/ \
&& cp -R ../compiler-rt projects/ \
&& mkdir build \
&& cd build
```

## LLVM 8 Build Options
```sh
#!/bin/bash
export CC=/usr/bin/gcc-5
export CXX=/usr/bin/g++-5

cmake \
    -G "Unix Makefiles" \
    -DCMAKE_INSTALL_PREFIX="/opt/bodge/llvm8/" \
    -DCMAKE_BUILD_TYPE="Release" \
    -DLLVM_TARGETS_TO_BUILD="X86" \
    -DLLVM_INCLUDE_TESTS=OFF \
    -DLLVM_ENABLE_CXX1Y=ON \
    -DLLVM_ENABLE_ASSERTIONS=OFF \
    -DLLVM_ENABLE_FFI=OFF \
    -DSPHINX_OUTPUT_HTML=OFF \
    -DSPHINX_OUTPUT_MAN=OFF \
    -DLLVM_ENABLE_TERMINFO=OFF \
    -DLLDB_DISABLE_CURSES=ON \
    -DLLVM_ENABLE_LIBEDIT=OFF \
    -DLLVM_PARALLEL_COMPILE_JOBS=4 \
    -DLLVM_BUILD_DOCS=OFF \
    -DLLVM_INCLUDE_EXAMPLES=OFF \
    -DLLVM_ENABLE_LIBPFM=OFF \
    -DLLVM_BUILD_LLVM_DYLIB=OFF \
    -DLLVM_LINK_LLVM_DYLIB=OFF \
    -DLLVM_CCACHE_BUILD=ON \
    ..

cmake --build . --target install
```

For `MSYS2 MinGW64`
```sh
-G "MinGW Makefiles" \
...
-DCMAKE_SH="CMAKE_SH-NOTFOUND" \
```
