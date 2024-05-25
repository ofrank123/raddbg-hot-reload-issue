const std = @import("std");

export fn foo() void {
    std.debug.print("Hello from the DLL", .{});
}
