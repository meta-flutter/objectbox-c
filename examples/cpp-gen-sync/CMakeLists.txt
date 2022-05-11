set(TARGET objectbox-c-examples-tasks-cpp-gen-sync)
add_executable(${TARGET} main.cpp tasklist.obx.cpp)
target_include_directories(${TARGET} PRIVATE objectbox-sync)
target_link_libraries(${TARGET} objectbox-sync)
