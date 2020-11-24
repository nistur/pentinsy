include <screwposts.scad>
include <layout.scad>

foot_size=19;

feet=[[0,-10],
    [77,28],
    [77,-18],
    [10,50],
    [20,-50],
    [-80,-25],
    [-72,34]];

module foot()
{
    translate([0,0,-1]) difference()
    {
        cylinder(r=1+(foot_size/2), h=1);
        translate([0,0,-0.5]) cylinder(r=(foot_size/2), h=2);
    }
}

union()
{
    difference()
    {
        intersection()
        {
            union()
            {
                import("obj/keyboard_bottom_base.stl");

                for(post=posts)
                {
                    translate([post[0]-5, post[1]-5, 0]) cube([10,10,bottom_height]);
                }
            }
            rotate(90, [1,0,0]) import("obj/keyboard_scaled.stl");
        }
        for(post=posts)
        {
            translate([post[0]-3.5, post[1]-3.5, -1.5]) cube([7,7,bottom_height]);
            translate([post[0], post[1], -1]) cylinder(r=2,h=bottom_height+2);
        }
    }
    
    for(foot=feet)
    {
        translate([foot[0], foot[1],0]) foot();
    }
}