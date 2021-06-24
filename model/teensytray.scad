include <fasteners.scad>;

module teensy()
{
    union()
    {
        translate([-9.5,-15.5,-1.4]) color("green") cube([19,31,1.7]);
        translate([-3.8,8.3,0]) color("gray") cube([7.6,9.2,3.8]);
        translate([-3.5,-5.5,0]) color("black") cube([7,7,1.2]);

        for(a=[0:11])
        {
            translate([7.5,-13.9+(a*2.5),0.2]) cylinder(r=0.85,h=0.11,$fn=10);
            translate([-7.5,-13.9+(a*2.5),0.2]) cylinder(r=0.85,h=0.11,$fn=10);
        }
    }
}

module tray()
{
    difference()
    {
        union()
        {
            translate([-10.5,-20.5,-3.6]) cube([21,37,2.2]);
            translate([-10.5,-15.5+0.01,-1.4]) cube([1.7,31-0.01,2.2]);
            translate([8.8,-15.5+0.01,-1.4]) cube([1.7,31-0.01,2.2]);
            translate([-10.5,14.8,-1.4]) cube([3,1.7,2.2]);
            translate([7.5,14.8,-1.4]) cube([3,1.7,2.2]);
        }
        teensy();
        translate([0,-18,0]) m1_5(5);
    }
}

module clip()
{
    difference()
    {
        translate([-4,-20.5,-1.4+0.01]) cube([8,6,2.2]);
        teensy();
        translate([0,-18,0]) m1_5(5);
    }
}

module controller_cutout()
{        
    translate([-4.5,8.3,-1]) cube([9,20,8]);
}

//clip();
//tray();

//controller_cutout();
//teensy();