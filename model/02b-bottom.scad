bottom=5.5;
overlap=1.5;

module outer()
{
    intersection()
    {
        difference()
        {
            translate([-100, -100,-20]) cube([200, 200, 20+bottom]);
            rotate(90, [1,0,0]) import("keyboard_1.5shrink.stl");
        }
        rotate(90, [1,0,0]) import("keyboard_scaled.stl");
    }
}

module inner()
{
    intersection()
    {
        difference()
        {
            translate([-100, -100,-20]) cube([200, 200, 20+bottom-overlap]);
            rotate(90, [1,0,0]) import("keyboard_2.5shrink.stl");
        }
        rotate(90, [1,0,0]) import("keyboard_1.5shrink.stl");
    }
}

union()
{
    inner();
    outer();
}