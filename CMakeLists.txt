cmake_minimum_required(VERSION 3.15)
project(goose_json_native LANGUAGES CXX)
add_library(goose_json_native STATIC native/accelerated.cpp native/vendor/simdutf/simdutf.cpp)
target_compile_features(goose_json_native PRIVATE cxx_std_17)
target_include_directories(goose_json_native PRIVATE native/vendor/simdutf)
set_target_properties(goose_json_native PROPERTIES POSITION_INDEPENDENT_CODE ON)
# Keep vendored C++ symbols private to this package, even if another package
# bundles a different simdutf version.
target_compile_definitions(goose_json_native PRIVATE simdutf=goose_json_simdutf)
# Goose links the program with a C driver, so publish the C++ driver's runtime.
target_link_libraries(goose_json_native PUBLIC ${CMAKE_CXX_IMPLICIT_LINK_LIBRARIES})
