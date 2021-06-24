include <teensytray.scad>
include <layout.scad>
include <keyswitches.scad>

module key_insert()
{
    difference()
    {
        union()
        {
            translate([-11,-11,4.5]) cube([22,22,14.5]);
            translate([-9,-9,3]) cube([18,18,3]);
        }
        union()
        {
            translate([-10,-10,6.5]) cube([20,20,13.51]);
            translate([-8,-8,5.5]) cube([16,16,2.51]);
            translate([-7,-7,-0.01]) cube([14,14,14]);
        }
    }
}

union()
{
    import("obj/keyboard_top_cutout.stl");
    intersection()
    {
        union()
        {
            for(a=keyswitches)
            {
                #translate(a[0]) 
                rotate(a[1][0], [1,0,0]) 
                rotate(a[1][1], [0,1,0])
                rotate(a[1][2], [0,0,1])
		    translate([0,0,a[2]])
                key_insert();
		
            }
        }
        rotate(90, [1,0,0]) import("obj/keyboard_scaled.stl");
    }
}
