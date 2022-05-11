set(TARGET objectbox-c-examples-tasks)

add_executable(${TARGET}
        main.c
        # Note: the flatcc sources are embedded into this project for convenience:
        ../../external/flatcc-src/builder.c
        ../../external/flatcc-src/emitter.c
        ../../external/flatcc-src/refmap.c
        )

target_include_directories(${TARGET} PRIVATE objectbox)
target_link_libraries(${TARGET} objectbox)

IF (CMAKE_ANDROID)
    target_link_libraries(${TARGET} log)
ENDIF ()
