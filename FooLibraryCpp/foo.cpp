#include <jni.h>

int foo() {
#if defined(__aarch64__)
  return 13;
#else
  return 42;
#endif
}

extern "C" JNIEXPORT jint JNICALL Java_com_example_foo_Foo_getResult(
    JNIEnv* env, jobject thiz
) {
  return foo();
}
