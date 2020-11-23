bottom=5.5;

posts=[
    [0,-10],
    [80,30],
    [80,-20],
    [10,50],
    [20,-50],
    [-80,-25],
    [-72,34]
];

module screwpost()
{
    difference()
    {
        cylinder(r=4,h=100);
        translate([0,0,-1]) cylinder(r=1.6,h=31);
    }
}

import("keyboard_top_switches.stl");

intersection()
{
    union()
    {
        for( post = posts )
        {
            translate([post[0],post[1], bottom]) screwpost();
        }
        for(a = [1:len(posts)-1])
        {
            dir=posts[a] - posts[0];
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
            
            translate([posts[0][0], posts[0][1], 30]) rotate(angle,[0,0,1]) cube([1,l,200]);
            translate([posts[a][0], posts[a][1], bottom]) rotate(angle,[0,0,10]) cube([1,200,200]);
        }
    }
    rotate(90,[1,0,0]) import("keyboard_2.5shrink.stl");
}