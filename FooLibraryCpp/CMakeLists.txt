cmake_minimum_required(VERSION 3.7)
project(foo)

option(FOO_AAR_INSTALL "Install to AAR" OFF)

add_library(foo foo.cpp)

if(FOO_AAR_INSTALL)
  install(TARGETS foo DESTINATION ${CMAKE_ANDROID_ARCH_ABI})
endif()
