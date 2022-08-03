const std = @import("std");
const Builder = std.build.Builder;

// pub fn build(b: *Builder) void {
//     const mode = b.standardReleaseOptions();

//     //var exe = b.addExecutable("gozig", "src/main.zig");
//     //exe.setBuildMode(mode);

//     // Add the C Library
//     const c_lib = b.addStaticLibrary("c_lib", "src/go-c.o");
//     c_lib.setBuildMode(mode);
//     c_lib.linkLibC();
//     //c_lib.addIncludeDir("lib");
//     c_lib.addIncludeDir("src");

//     const exe = b.addExecutable("gozig", "src/main.zig");
//     exe.setBuildMode(mode);
//     exe.linkLibrary(c_lib);
//     exe.addIncludeDir("src");
//     //exe.addIncludeDir("lib");
//     exe.install();

//     const run = exe.run();
//     run.step.dependOn(b.getInstallStep());
// }

pub fn build(b: *Builder) void {
    const mode = b.standardReleaseOptions();

    var exe = b.addExecutable("gozig", "src/main.zig");
    exe.addCSourceFile("lib/go-c.h", &[_][]const u8{"-std=c99"});
    exe.addObjectFile("lib/go-c.o");
    exe.linkSystemLibrary("c");
    exe.setBuildMode(mode);

    exe.addIncludeDir("lib");

    exe.install();

    const run = exe.run();
    run.step.dependOn(b.getInstallStep());
}