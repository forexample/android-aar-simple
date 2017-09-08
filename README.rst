AAR Example
-----------

Example of creation AAR with C++ `*.so` library.

Instructions for creating AAR:

* https://developer.android.com/studio/projects/android-library.html

Create AAR
----------

On first run open ``FooLibrary`` project in Android Studio to initialize
all local settings, then close this project.

Run build script:

.. code-block:: none

  > cd android-aar-simple
  [android-aar-simple]> ./create-aar.sh
  [android-aar-simple]> ls foo-debug.aar
  foo-debug.aar

Script will run builds with two toolchain:

* android-ndk-r10e-api-21-arm64-v8a
* android-ndk-r10e-api-19-armeabi-v7a-neon-clang-libcxx

Libraries will be installed to:

* FooLibrary/foo/src/main/jniLibs/arm64-v8a
* FooLibrary/foo/src/main/jniLibs/armeabi-v7a

Sources:

* FooLibraryCpp/CMakeLists.txt - CMake code with C++ library
* FooLibraryCpp/foo.cpp - define 'foo()' function and Java export call
* FooLibrary/foo/src/main/java/com/example/foo/Foo.java - Java interface with "native" method

Use AAR
-------

Open project ``android-aar-simple/UseFoo`` and follow instructions for adding AAR:

* ``File -> New -> New Module ... -> Import .JAR/.AAR Package`` find ``foo-debug.aar`` and load it
* In file ``android-aar-simple/UseFoo/app/build.gradle`` add line:

.. code-block:: none

  dependencies {
    compile project(":foo-debug")
  }

* Sync project
* Build -> Make Project
* Run example on device
