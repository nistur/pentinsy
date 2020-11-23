module key_cutout()
{
    translate([-10,-10,6.5]) cube([20,20,9.51]);
//    translate([-8,-8,5.5]) cube([16,16,2.51]);
//    translate([-7,-7,-0.01]) cube([14,14,14]);
}

difference()
{
    import("keyboard_top_base.stl");
    // thumb
    translate([-12,-30,43]) rotate(36,[1,0,0]) rotate(10, [0,0,1]) translate([0,0,-3]) key_cutout();
    
    // finger 1
    translate([-65,-5,56]) rotate(-10, [1,0,0]) rotate(-8, [0,1,0]) translate([0,0,-2.5]) key_cutout();
    
    // finger 2
    translate([-62,16,47]) rotate(-35, [1,0,0]) rotate(0, [0,1,0]) rotate(-5,[0,0,1]) rotate(-10, [0,1,0]) translate([0,0,-2]) key_cutout();
    
    // finger 3
    translate([-52,35,30]) rotate(-50, [1,0,0]) rotate(-10, [0,0,1]) rotate(-6, [0,1,0]) translate([0,0,-2]) key_cutout();
    
    // finger 4
    translate([-32, 46, 15]) rotate(-67, [1,0,0]) rotate(-10, [0,0,1]) translate([0,0,-2]) key_cutout();
    
    // repeat
    translate([-35,16,49]) rotate(-34, [1,0,0]) rotate(0, [0,1,0]) rotate(-5,[0,0,1]) rotate(0, [0,1,0]) translate([0,0,-2]) key_cutout();
}