include <layout.scad>

module outer()
{
    intersection()
    {
        difference()
        {
            translate([-100, -100,bottom_height]) cube([200, 200, 200]);
            rotate(90, [1,0,0]) import("obj/keyboard_1.5shrink.stl");
        }
        rotate(90, [1,0,0]) import("obj/keyboard_scaled.stl");
    }
}

module inner()
{
    intersection()
    {
        difference()
        {
            translate([-100, -100,bottom_height-bottom_overlap]) cube([200, 200, 200]);
            rotate(90, [1,0,0]) import("obj/keyboard_2.5shrink.stl");
        }
        rotate(90, [1,0,0]) import("obj/keyboard_1.5shrink.stl");
    }
}

union()
{
    inner();
    outer();
}