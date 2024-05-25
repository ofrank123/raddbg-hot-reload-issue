# Raddbg Issue #228
This repo reproduces a bug in raddbg 0.9.10.

# To run
Install zig locally using `.\install-tools` (n.b. the script uses `Expand-Archive` which is incredibly slow.  Feel free to grab zig and install it yourself).

To build, run:
```
zig build
```

Then you can run the debugger on `zig-out/test.exe` (with `zig-out` as the working dir).  You will see that the current version of raddbg fails to create debug info for the library.
