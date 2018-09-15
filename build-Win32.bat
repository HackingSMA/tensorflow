::Use x64 Native Tools Comand Prompt for VS 2017

:: Interesting references:
:: https://medium.com/@shiweili/building-tensorflow-c-shared-library-on-windows-e79c90e23e6e
:: https://anyline.com/news/consume-tensorflow-net/


PUSHD .

call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\VC\Auxiliary\Build\vcvarsall.bat" x64

:: delete previous build, if it exists
if exist tensorflow\contrib\cmake\build-Win32\ rmdir /s tensorflow\contrib\cmake\build-Win32\

mkdir tensorflow\contrib\cmake\build-Win32
cd tensorflow\contrib\cmake\build-Win32

cmake .. ^
-G "Visual Studio 15 2017" ^
-T host=x64 -DCMAKE_BUILD_TYPE=Release ^
-Dtensorflow_BUILD_PYTHON_BINDINGS=OFF ^
-Dtensorflow_ENABLE_GRPC_SUPPORT=OFF ^
-Dtensorflow_BUILD_SHARED_LIB=ON ^
-Dtensorflow_VERBOSE=ON ^
-Dtensorflow_WIN_CPU_SIMD_OPTIONS=/arch:AVX ^
 


:: Other interesting options:

:: Faster builds (for testing):
:: -Dtensorflow_BUILD_ALL_KERNELS=OFF -Dtensorflow_BUILD_CONTRIB_KERNELS=OFF

:: Generate .pdb files, currently fails to build due to file size restrictions although there are other hacks: 
:: -DCMAKE_BUILD_TYPE=RelWithDebInfo


MSBuild /p:Configuration=Release tensorflow.vcxproj

POPD
