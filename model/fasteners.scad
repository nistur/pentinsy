p=30;
module bolt(m,l,hh,hr)
{
    union()
    {
        translate([0,0,-l]) cylinder(r=m/2,h=l+0.01,$fn=p);
        cylinder(r=hr+0.5,h=hh+0.01,$fn=p);
    }
}

module nut(m,d,s,hollow)
{
    difference()
    {
        union()
        {
            h=s/(sqrt(3));
            l=2*h;
            //h=sqrt((l*l)-(s*s));
            translate([0,0,d/2]) cube([h,s,d], center=true);
            translate([0,0,d/2]) rotate(60,[0,0,1]) cube([h,s,d], center=true);
            translate([0,0,d/2]) rotate(120,[0,0,1]) cube([h,s,d], center=true);
        }
        if(hollow==true)
        {
            translate([0,0,-clr]) cylinder(r=m/2,h=d+(2*clr),$fn=p);
        }
    }
}

module m4_nut(hollow)
{
    nut(4,3.2,7, hollow);
}

module m3_nut(hollow)
{
    nut(3,2.4,5.5, hollow);
}

module m4(h)
{
    bolt(4,h,4,3);
}

module m3(h)
{
    bolt(3,h,3,2.25);
}

module m1_5(h)
{
    bolt(1.5,h,1,1.3);
}


function self_tapping_screw(size) = (3*size)/8;