const std = @import("std");
const c = @import("c.zig");


pub fn main() !void {

    const my_xkcd = c.GetXKCD(100);

    const stdout = &std.io.getStdOut().writer();
    try stdout.print("title: {s}, url: {s}\n", .{my_xkcd.r0, my_xkcd.r1});
}