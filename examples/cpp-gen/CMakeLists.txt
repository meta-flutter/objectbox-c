set(TARGET objectbox-c-examples-tasks-cpp-gen)
add_executable(${TARGET} main.cpp tasklist.obx.cpp)
target_include_directories(${TARGET} PRIVATE objectbox)
target_link_libraries(${TARGET} objectbox)
