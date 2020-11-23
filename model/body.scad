module body()
{
    s=13.5;
    scale([s,s,s]) import("kbd.stl");
    //scale([s,s,s]) rotate(90, [1,0,0]) import("kbd_simplified2.stl");
}

module top()
{
    intersection()
    {
        translate([0,0,-5]) body();
        translate([-100, -70, 0]) cube([200, 140, 75]);
    }
}
module bottom()
{
    intersection()
    {
        body();
        translate([-100, -70, 0]) cube([200, 140, 5]);
    }
}

module top_shell()
{
//   minkowski()
   { 
        difference()
        {
            translate([-100, -70, 0.1]) cube([200, 140, 75]);
            top();
        }
        sphere(r=2);
    }
}

module key_cutout()
{
    translate([-10,-10,6.5]) cube([20,20,9.51]);
    translate([-8,-8,5.5]) cube([16,16,2.51]);
    translate([-7,-7,-0.01]) cube([14,14,14]);
}
/*
difference()
{
    top();
    // thumb
    translate([-12,-30,38]) rotate(36,[1,0,0]) rotate(10, [0,0,1]) translate([0,0,-3]) key_cutout();
    
    // finger 1
    translate([-65,-5,51]) rotate(-10, [1,0,0]) rotate(-8, [0,1,0]) translate([0,0,-3]) key_cutout();
    
    // finger 2
    translate([-62,16,42]) rotate(-35, [1,0,0]) rotate(0, [0,1,0]) rotate(-5,[0,0,1]) rotate(-10, [0,1,0]) translate([0,0,-2]) key_cutout();
    
    // finger 3
    translate([-52,35,25]) rotate(-50, [1,0,0]) rotate(-10, [0,0,1]) rotate(-6, [0,1,0]) translate([0,0,-2]) key_cutout();
    
    // finger 4
    #translate([-32, 46, 10]) rotate(-67, [1,0,0]) rotate(-10, [0,0,1]) translate([0,0,-2]) key_cutout();
    
    // repeat
    translate([-35,16,44]) rotate(-34, [1,0,0]) rotate(0, [0,1,0]) rotate(-5,[0,0,1]) rotate(0, [0,1,0]) translate([0,0,-2]) key_cutout();
}
*/

//top_shell();
/*
intersection()
{
    translate([0,0,-35]) rotate(90, [1,0,0]) import("keyboard_scaled.stl");
    difference() 
    {
        translate([-100, -75, -25]) cube([200, 150, 60]);
        scale([0.95, 0.95, 0.95]) translate([0,0,-35]) rotate(90, [1,0,0]) import("keyboard_scaled.stl");
    }
}
*/

translate([0,-300, 0]) rotate(90, [1,0,0]) import("keyboard_scaled.stl");
// import("keyboard_switches.stl");
translate([0,-150,0])rotate(90, [1,0,0]) import("keyboard_1.5shrink.stl");
translate([-210,-150,0])rotate(90, [1,0,0]) import("keyboard_2.5shrink.stl");
import("keyboard_top_base.stl");
translate([0,150,0]) import("keyboard_top_cutout.stl");
translate([0,300,0]) import("keyboard_top_switches.stl");
translate([0,450,0])union()
{
    import("keyboard_top_switches.stl");
    import("keyboard_top_screwposts.stl");
}

/*difference()
{
    cylinder(r=19, h=16);
    key_cutout();
}*/