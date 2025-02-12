cmake_minimum_required(VERSION 3.0)

# Set Emscripten as the compiler if building for web
if(PLATFORM_WEB)
    set(CMAKE_TOOLCHAIN_FILE "${CMAKE_SOURCE_DIR}/tools/emsdk/upstream/emscripten/cmake/Modules/Platform/Emscripten.cmake")
endif()

project(my_raylib_game C)
set(CMAKE_C_STANDARD 99)

# Check if we're building for web platform
if(EMSCRIPTEN)
    set(PLATFORM_WEB TRUE)
    # Web configurations
    set(CMAKE_EXECUTABLE_SUFFIX ".html")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -s USE_GLFW=3 -s ASSERTIONS=1 -s WASM=1 -s ASYNCIFY -s INITIAL_MEMORY=64MB -s ALLOW_MEMORY_GROWTH=1")
    
    # Configure raylib for web
    set(GRAPHICS "GRAPHICS_API_OPENGL_ES2" CACHE STRING "" FORCE)
    set(PLATFORM "Web" CACHE STRING "" FORCE)
    
    # Handle paths with spaces
    file(TO_NATIVE_PATH "${CMAKE_SOURCE_DIR}/assets" ASSETS_PATH)
    file(TO_NATIVE_PATH "${CMAKE_SOURCE_DIR}/shell.html" SHELL_PATH)
    string(REPLACE "\\" "/" ASSETS_PATH "${ASSETS_PATH}")
    string(REPLACE "\\" "/" SHELL_PATH "${SHELL_PATH}")
    
    # Preload the assets directory
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} --preload-file \"${ASSETS_PATH}@/assets\" --shell-file \"${SHELL_PATH}\"")
else()
    set(PLATFORM_WEB FALSE)
endif()

# Adding Raylib
include(FetchContent)
set(FETCHCONTENT_QUIET FALSE)
set(BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
set(BUILD_GAMES    ON CACHE BOOL "" FORCE)

FetchContent_Declare(
    raylib
    GIT_REPOSITORY "https://github.com/raysan5/raylib.git"
    GIT_TAG "master"
    GIT_PROGRESS TRUE
)

FetchContent_MakeAvailable(raylib)

# Adding our source files
file(GLOB_RECURSE PROJECT_SOURCES CONFIGURE_DEPENDS "${CMAKE_CURRENT_LIST_DIR}/sources/*.c")
set(PROJECT_INCLUDE "${CMAKE_CURRENT_LIST_DIR}/sources/")

# Declaring our executable
add_executable(${PROJECT_NAME})
target_sources(${PROJECT_NAME} PRIVATE ${PROJECT_SOURCES})
target_include_directories(${PROJECT_NAME} PRIVATE ${PROJECT_INCLUDE})

if(PLATFORM_WEB)
    # Web-specific settings
    target_link_libraries(${PROJECT_NAME} PRIVATE raylib)
else()
    # Desktop-specific settings
    if((${CMAKE_SYSTEM_PROCESSOR} STREQUAL "armv7l" OR ${CMAKE_SYSTEM_PROCESSOR} STREQUAL "aarch64") AND ${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
        target_link_libraries(${PROJECT_NAME} PRIVATE raylib atomic ${EXTRA_LIBS})
    else()
        target_link_libraries(${PROJECT_NAME} PRIVATE raylib ${EXTRA_LIBS}) 
    endif()
endif()

# Setting ASSETS_PATH
if(PLATFORM_WEB)
    target_compile_definitions(${PROJECT_NAME} PUBLIC ASSETS_PATH="/assets/")
else()
    target_compile_definitions(${PROJECT_NAME} PUBLIC ASSETS_PATH="${CMAKE_CURRENT_SOURCE_DIR}/assets/")
endif()

# Print CMAKE_C_COMPILER_ID
message(STATUS "CMAKE_C_COMPILER_ID: ${CMAKE_C_COMPILER_ID}")

# Configure compiler and linker options based on the compiler
if(NOT PLATFORM_WEB)
    if(("${CMAKE_C_COMPILER_ID}" STREQUAL "GNU") OR (${CLANG}))
        # GCC settings
    elseif("${CMAKE_C_COMPILER_ID}" STREQUAL "MSVC")
        target_link_options(${PROJECT_NAME} PRIVATE "/SUBSYSTEM:windows" "/ENTRY:mainCRTStartup")
    endif()
endif()

# Check if we are compiling for ARM32 and Linux
if ((${CMAKE_SYSTEM_PROCESSOR} STREQUAL "armv7l" OR ${CMAKE_SYSTEM_PROCESSOR} STREQUAL "aarch64") AND ${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
    set(EXTRA_LIBS "-latomic") # Link the libatomic library with -latomic flag
    target_compile_definitions(${PROJECT_NAME} PUBLIC ) # Set GLSL version to 330
    target_compile_definitions(${PROJECT_NAME} PUBLIC ) # Set GL version to 3.3
endif()