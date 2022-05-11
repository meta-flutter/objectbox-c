
function(defineObjectBoxLibForURL VARIANT DL_URL)

    set(TARGET objectbox${VARIANT}-fetch-content)

    include(FetchContent)
    FetchContent_Declare(${TARGET} URL ${DL_URL})
    FetchContent_MakeAvailable(${TARGET})

    set(DL_DIR "${${TARGET}_SOURCE_DIR}")
    message(STATUS "Pre-compiled ObjectBox library is saved in ${DL_DIR}")

    if (VARIANT STREQUAL "-sync")
        include (objectbox-sync)
    else ()
        include (objectbox)
    endif ()
    
endfunction()

function(defineObjectBoxLib VARIANT)

    # Platform detection and other setup
    set(DL_URL https://github.com/objectbox/objectbox-c/releases/download)

    set(DL_EXTENSION "tar.gz")
    if (${CMAKE_SYSTEM_NAME} STREQUAL Darwin)
        set(DL_PLATFORM "MacOS-universal")
        set(DL_EXTENSION "zip")
    elseif (${CMAKE_SYSTEM_NAME} STREQUAL Windows)
        set(DL_EXTENSION "zip")
        if (CMAKE_SIZEOF_VOID_P MATCHES 8)
            set(DL_PLATFORM ${CMAKE_SYSTEM_NAME}-x64)
        else ()
            set(DL_PLATFORM ${CMAKE_SYSTEM_NAME}-x86)
        endif ()
    elseif (${CMAKE_SYSTEM_PROCESSOR} STREQUAL x86_64)
        set(DL_PLATFORM ${CMAKE_SYSTEM_NAME}-x64)
    else ()
        set(DL_PLATFORM ${CMAKE_SYSTEM_NAME}-${CMAKE_SYSTEM_PROCESSOR})
    endif ()

    if (${DL_PLATFORM} MATCHES "^Linux-armv7")
        set(DL_PLATFORM "Linux-armv7hf") # show what we actually download
    elseif (${DL_PLATFORM} MATCHES "^Linux-armv6")
        set(DL_PLATFORM "Linux-armv6hf") # show what we actually download
    endif ()

    string(TOLOWER ${DL_PLATFORM} DL_PLATFORM)
    set(DL_URL ${DL_URL}/v${PROJECT_VERSION}/objectbox${VARIANT}-${DL_PLATFORM}.${DL_EXTENSION})
    message(STATUS "Using pre-compiled ObjectBox${VARIANT} library v${PROJECT_VERSION} for ${DL_PLATFORM}: ${DL_URL}")

    defineObjectBoxLibForURL("${VARIANT}" "${DL_URL}")
endfunction()


if (DEFINED ENV{OBJECTBOX_ARTIFACT_URL})
    set(DL_URL $ENV{OBJECTBOX_ARTIFACT_URL})
    message(STATUS "Using pre-compiled ObjectBox library from the OBJECTBOX_ARTIFACT_URL environment variable: ${DL_URL}")
    defineObjectBoxLibForURL("" "${DL_URL}")
else ()
    defineObjectBoxLib("")
endif ()

if (DEFINED ENV{OBJECTBOX_SYNC_ARTIFACT_URL})
    set(DL_URL $ENV{OBJECTBOX_SYNC_ARTIFACT_URL})
    message(STATUS "Using pre-compiled ObjectBox library from the OBJECTBOX_SYNC_ARTIFACT_URL environment variable: ${DL_URL}")
    defineObjectBoxLibForURL("" "${DL_URL}")
else ()
    defineObjectBoxLib("-sync")
endif ()
