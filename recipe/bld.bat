setlocal EnableDelayedExpansion

mkdir "%SRC_DIR%"\build
pushd "%SRC_DIR%"\build

cmake -G "NMake Makefiles" ^
      -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DTILEDB_WERROR=OFF ^
      -DTILEDB_TBB_SHARED=ON ^
      -DTILEDB_S3=ON ^
      -DTILEDB_AZURE=ON ^
      -DTILEDB_HDFS=OFF ^
      -DCOMPILER_SUPPORTS_AVX2=OFF ^
      -DTILEDB_SERIALIZATION=ON ^
      ..
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1

pushd "tiledb"
nmake install
if errorlevel 1 exit 1
popd

popd
