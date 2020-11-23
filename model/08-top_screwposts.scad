include <teensytray.scad>
include <screwposts.scad>
include <layout.scad>
include <fasteners.scad>

module screwpost()
{
    difference()
    {
        cylinder(r=4,h=100);
    }
}

module screwhole()
{
    translate([0,0,-1]) cylinder(r=self_tapping_screw(screw_size),h=31,$fn=30);
}


module allposts()
{
    for( post = posts )
    {
        translate([post[0],post[1], bottom_height]) screwpost();
    }
}

module allholes()
{
    for( post = posts )
    {
        translate([post[0],post[1], bottom_height]) screwhole();
    }
}

module bracing()
{
    center=[posts[0][0],posts[0][1]];
    
    for(a = [1:len(posts)-1])
    {
        post=[posts[a][0],posts[a][1]];
        dir=post - center;
        start=[0,1];
        distx=posts[a][0]-posts[0][0];
        disty=posts[a][1]-posts[0][1];
        distx2=distx*distx;
        disty2=disty*disty;
        l=sqrt(distx2+disty2);
        dot=start*dir;
        //a.b=|a||b|cosθ
        dirlen=sqrt((dir[0]*dir[0])+(dir[1]*dir[1]));
        cost=dot/dirlen;

        angle=acos(cost) * -sign(dir[0]);
        
        if(posts[a][2] == true)
        {
            translate([posts[0][0], posts[0][1], 30]) rotate(angle,[0,0,1]) cube([1,l,200]);
        }
        translate([posts[a][0], posts[a][1], bottom_height]) rotate(angle,[0,0,10]) cube([1,200,200]);
    }
}

module controllertray()
{
        translate(controller[0]) rotate(controller[1][0], [1,0,0]) rotate(controller[1][1], [0,1,0]) rotate(controller[1][2], [0,0,1]) color("gray") tray();
    // TODO: Make supports for tray follow layout rules
        translate([67,10,11]) rotate(-5,[0,0,1]) cube([40,1,50]);
        translate([67,-9,11]) rotate(-5,[0,0,1]) cube([40,1,50]);
}

union()
{
    
//import("keyboard_top_switches.stl");
intersection()
{
    difference()
    {
        union()
        {
            allposts();
            bracing();
            controllertray();
            
        }
        allholes();
    }
    rotate(90,[1,0,0]) import("obj/keyboard_1.5shrink.stl");
    
}
}