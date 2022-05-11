add_library(objectbox-sync INTERFACE)
target_include_directories(objectbox-sync SYSTEM INTERFACE
    ${objectbox-sync-fetch-content_SOURCE_DIR}/include
    ${CMAKE_CURRENT_SOURCE_DIR}/external
    ${CMAKE_CURRENT_SOURCE_DIR}/include
    )

set_target_properties(objectbox-sync PROPERTIES
    INTERFACE_OBJECTBOX_SYNC_NAME "ObjectBox Sync C/C++ Library and Headers"
    INTERFACE_OBJECTBOX_SYNC_URL "https://objectbox.io/"
    INTERFACE_OBJECTBOX_SYNC_AUTHOR "ObjectBox"
    INTERFACE_OBJECTBOX_LICENSE ${CMAKE_CURRENT_SOURCE_DIR}/LICENSE.txt
    INTERFACE_LINK_DIRECTORIES ${objectbox-sync-fetch-content_SOURCE_DIR}/lib
    INTERFACE_LINK_LIBRARIES -lobjectbox
    C_STANDARD 99
    CXX_STANDARD 11
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE YES
)
