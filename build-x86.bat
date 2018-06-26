::Use x64 Native Tools Comand Prompt for VS 2017

mkdir tensorflow\contrib\cmake\build
cd tensorflow\contrib\cmake\build

cmake .. -T host=x64 -DCMAKE_BUILD_TYPE=Release -Dtensorflow_BUILD_PYTHON_BINDINGS=OFF -Dtensorflow_ENABLE_GRPC_SUPPORT=OFF -Dtensorflow_BUILD_SHARED_LIB=ON -Dtensorflow_VERBOSE=ON -Dtensorflow_BUILD_CONTRIB_KERNELS=OFF -Dtensorflow_OPTIMIZE_FOR_NATIVE_ARCH=OFF -Dtensorflow_WIN_CPU_SIMD_OPTIONS=OFF 

MSBuild /p:Configuration=Release tf_tutorials_example_trainer.vcxproj