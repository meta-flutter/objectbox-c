set(TARGET objectbox-c-gen-test)

add_executable(${TARGET}
        plain-c-test-main.c
        ../external/flatcc-src/builder.c
        ../external/flatcc-src/emitter.c
        ../external/flatcc-src/refmap.c
        )

target_include_directories(${TARGET} PRIVATE objectbox)
target_link_libraries(${TARGET} objectbox)

IF (CMAKE_ANDROID)
    target_link_libraries(${TARGET} log)
ENDIF ()
