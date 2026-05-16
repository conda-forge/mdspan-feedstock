@echo on

mkdir build
cd build

cmake %CMAKE_ARGS% ^
  -GNinja ^
  -DCMAKE_BUILD_TYPE=Release ^
  -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
  -DCMAKE_INSTALL_LIBDIR=lib ^
  -DMDSPAN_ENABLE_TESTS=OFF ^
  -DMDSPAN_ENABLE_EXAMPLES=OFF ^
  -DMDSPAN_ENABLE_BENCHMARKS=OFF ^
  -DMDSPAN_INSTALL_STDMODE_HEADERS=ON ^
  -DMDSPAN_GENERATE_STD_NAMESPACE_TARGETS=ON ^
  ..
if errorlevel 1 exit 1

cmake --build . --target install
if errorlevel 1 exit 1
