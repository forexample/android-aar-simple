#!/bin/bash -e

set -x

THIS_SCRIPT_DIR=`dirname "${BASH_SOURCE[0]}"`

INSTALL_DESTINATION=${THIS_SCRIPT_DIR}/FooLibrary/foo/src/main/jniLibs/

rm -rf "${INSTALL_DESTINATION}"
mkdir "${INSTALL_DESTINATION}"

polly.py \
    --home "${THIS_SCRIPT_DIR}/FooLibraryCpp" \
    --toolchain android-ndk-r10e-api-21-arm64-v8a \
    --verbose \
    --config Release \
    --fwd \
    BUILD_SHARED_LIBS=ON \
    FOO_AAR_INSTALL=ON \
    "CMAKE_INSTALL_PREFIX=${INSTALL_DESTINATION}" \
    --install

polly.py \
    --home "${THIS_SCRIPT_DIR}/FooLibraryCpp" \
    --toolchain android-ndk-r10e-api-19-armeabi-v7a-neon-clang-libcxx \
    --verbose \
    --config Release \
    --fwd \
    BUILD_SHARED_LIBS=ON \
    FOO_AAR_INSTALL=ON \
    "CMAKE_INSTALL_PREFIX=${INSTALL_DESTINATION}" \
    --install

cd "${THIS_SCRIPT_DIR}/FooLibrary"

./gradlew assembleDebug

mv ./foo/build/outputs/aar/foo-debug.aar ..
