cmake_minimum_required(VERSION 3.0)
project(GoAndCppIntegration)

# Set the directory containing the FindGo.cmake module
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/")

# Locate Go using the FindGo.cmake module
find_package(Go REQUIRED)

# Add a custom target to build the Go code
add_custom_target(
    go_build
    go build -buildmode=c-shared -o ${CMAKE_CURRENT_SOURCE_DIR}/lib/libhello.so ${CMAKE_CURRENT_SOURCE_DIR}/golang/hello.go
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    COMMENT "Building Go code"
)

# Compile the C++ code
add_executable(main src/main.cpp)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)

# Add dependency of main executable on go_build target
add_dependencies(main go_build  )

# Link against the shared library created by the Go build
target_link_libraries(main ${CMAKE_CURRENT_SOURCE_DIR}/lib/libhello.so)
