@echo off
setlocal

REM Create tools directory if it doesn't exist
if not exist "tools" (
    echo Setting up Emscripten locally...
    mkdir tools
    cd tools
    git clone https://github.com/emscripten-core/emsdk.git
    cd emsdk
    call emsdk install latest
    call emsdk activate latest
    cd ../..
) else (
    echo Using existing Emscripten installation...
)

REM Set up Emscripten environment
call tools\emsdk\emsdk_env.bat

REM Create build directory if it doesn't exist
if not exist "build-web" mkdir build-web

REM Navigate to build directory
cd build-web

REM Configure with CMake using Emscripten
emcmake cmake -DPLATFORM_WEB=ON -DCMAKE_BUILD_TYPE=Release -G Ninja ..

REM Build
cmake --build . --config Release

echo.
echo Build complete! The output files are in the build-web directory.
echo To run the game, you need to serve the files through a web server.
echo You can use Python's built-in server by running: python -m http.server
echo Then open http://localhost:8000/my_raylib_game.html in your web browser.

cd .. 