include <teensytray.scad>
include <layout.scad>
include <keyswitches.scad>

module key_cutout()
{
    translate([-10,-10,6.5]) cube([20,20,9.51]);
}

difference()
{
    import("obj/keyboard_top_base.stl");
    
    for(a=keyswitches)
    {
        translate(a[0]) 
        rotate(a[1][0], [1,0,0]) 
        rotate(a[1][1], [0,1,0])
        rotate(a[1][2], [0,0,1])
        key_cutout();
        
    }
    
    translate(controller[0]) rotate(controller[1][0], [1,0,0]) rotate(controller[1][1], [0,1,0]) rotate(controller[1][2], [0,0,1]) color("gray") controller_cutout();
}