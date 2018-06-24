::Use x64 Native Tools Comand Prompt for VS 2017

SET PYTHON="C:\ProgramData\Anaconda2\python.exe"
SET PYTHON_LIB="C:\ProgramData\Anaconda2\python27.dll"
SET SWIG="C:\Program Files (x86)\swigwin-3.0.12\swig.exe"

mkdir tensorflow\contrib\cmake\build
cd tensorflow\contrib\cmake\build



cmake .. -T host=x64 -DCMAKE_BUILD_TYPE=Release -DSWIG_EXECUTABLE=%SWIG% -DPYTHON_EXECUTABLE=%PYTHON% -DPYTHON_LIBRARIES=%PYTHON_LIB% -Dtensorflow_ENABLE_GRPC_SUPPORT=OFF -Dtensorflow_BUILD_SHARED_LIB=ON -Dtensorflow_VERBOSE=ON -Dtensorflow_BUILD_CONTRIB_KERNELS=OFF -Dtensorflow_OPTIMIZE_FOR_NATIVE_ARCH=OFF -Dtensorflow_WIN_CPU_SIMD_OPTIONS=OFF 

MSBuild /p:Configuration=Release tf_tutorials_example_trainer.vcxproj