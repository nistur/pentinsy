bottom=5;
overlap=1;

module outer()
{
    difference()
    {
        import("keyboard_switches.stl");
        import("keyboard_1.5shrink.stl");
        translate([-100, -100, bottom]) cube([200, 200, 200]);
    }
}

module inner()
{
    difference()
    {
        import("keyboard_1.5shrink.stl");
        import("keyboard_2.5shrink.stl");
        translate([-100, -100,bottom-overlap]) cube([200, 200, 200]);
    }
}

union()
{
    inner();
    outer();
}