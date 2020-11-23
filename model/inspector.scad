// initial input - scaled correctly, and possibly simplified for testing
// but otherwise unchanged
translate([0,-300, 0]) rotate(90, [1,0,0]) import("obj/keyboard_scaled.stl");

// two slightly shrunken models - these are used to cut out the inside of the
// model, allowing it to be converted to a shell
translate([0,-150,0])rotate(90, [1,0,0]) import("obj/keyboard_1.5shrink.stl");
translate([-210,-150,0])rotate(90, [1,0,0]) import("obj/keyboard_2.5shrink.stl");

// Top shell
import("obj/keyboard_top_base.stl");

// Cutouts for keyswitches and USB cable
translate([0,150,0]) import("obj/keyboard_top_cutout.stl");

// mounting points for keyswitches added
translate([0,300,0]) import("obj/keyboard_top_switches.stl");

// separate model containing screwposts, bracing and electronics mounting
translate([-210,300,0]) import("obj/keyboard_screwposts.stl");

// Final output
translate([0,450,0]) color("red") import("out/keyboard_top.stl");

// Clip to hold in controller board
translate([-120,450,0]) color("red") import("out/controller_clip.stl");
