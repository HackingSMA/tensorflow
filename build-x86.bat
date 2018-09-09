::Use x64 Native Tools Comand Prompt for VS 2017

:: Interesting references:
:: https://medium.com/@shiweili/building-tensorflow-c-shared-library-on-windows-e79c90e23e6e
:: https://anyline.com/news/consume-tensorflow-net/


PUSHD .

:: delete previous build, if it exists
if exist tensorflow\contrib\cmake\build-x86\ rmdir /s tensorflow\contrib\cmake\build-x86\

mkdir tensorflow\contrib\cmake\build-x86
cd tensorflow\contrib\cmake\build-x86

cmake .. ^
-T host=x64 -DCMAKE_BUILD_TYPE=Release ^
-Dtensorflow_BUILD_PYTHON_BINDINGS=OFF ^
-Dtensorflow_ENABLE_GRPC_SUPPORT=OFF ^
-Dtensorflow_BUILD_SHARED_LIB=ON ^
-Dtensorflow_VERBOSE=ON ^
-Dtensorflow_BUILD_CONTRIB_KERNELS=OFF ^
-Dtensorflow_WIN_CPU_SIMD_OPTIONS=/arch:AVX ^
 

:: Other interesting options:

:: Faster builds (for testing):
:: -Dtensorflow_BUILD_ALL_KERNELS=OFF -Dtensorflow_BUILD_CONTRIB_KERNELS=OFF

:: Generate .pdb files, currently fails to build due to file size restrictions although there are other hacks: 
:: -DCMAKE_BUILD_TYPE=RelWithDebInfo


MSBuild /p:Configuration=Release tensorflow.vcxproj

POPD
