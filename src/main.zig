const std = @import("std");

pub fn main() void {
    std.fs.Dir.copyFile(
        std.fs.cwd(),
        "test-lib.dll",
        std.fs.cwd(),
        "test-lib_TMP.dll",
        .{},
    ) catch |err| {
        std.debug.print("Failed to copy dll: {s}", .{@errorName(err)});
        return;
    };

    var dll = std.DynLib.open("./test-lib_TMP.dll") catch |err| {
        std.debug.print("Failed to open dll: {s}", .{@errorName(err)});
        return;
    };

    const dll_foo =
        dll.lookup(*const fn () void, "foo") orelse {
        std.debug.print("Could not lookup symbol in dll", .{});
        return;
    };

    dll_foo();
}
