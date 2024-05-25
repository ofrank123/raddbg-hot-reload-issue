:: DOWNLOAD AND INSTALL ZIG

rem download
if not exist "tools" mkdir tools
powershell -Command "Invoke-WebRequest https://ziglang.org/download/0.12.0/zig-windows-x86_64-0.12.0.zip -OutFile tools\zig_win32.zip"
rem unpack
Powershell Expand-Archive -Force -Path "tools\zig_win32.zip" -DestinationPath "tools\zig_win32"
robocopy ".\tools\zig_win32\zig-windows-x86_64-0.12.0" ".\tools\zig_win32" * /mt /e /move > nul
