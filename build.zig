const std = @import("std");
const Build = std.Build;

pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addSharedLibrary(.{
        .name = "test-lib",
        .root_source_file = b.path("src/lib.zig"),
        .target = target,
        .optimize = optimize,
    });
    const lib_install_step = b.addInstallArtifact(lib, .{
        .dest_dir = .{ .override = .{ .custom = "./" } },
    });
    b.getInstallStep().dependOn(&lib_install_step.step);

    const exe = b.addExecutable(.{
        .name = "test",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });
    const exe_install_step = b.addInstallArtifact(exe, .{
        .dest_dir = .{ .override = .{ .custom = "./" } },
    });
    b.getInstallStep().dependOn(&exe_install_step.step);
}
