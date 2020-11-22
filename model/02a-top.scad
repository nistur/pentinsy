bottom=5;
overlap=1;

module outer()
{
    intersection()
    {
        difference()
        {
            translate([-100, -100, bottom]) cube([200, 200, 200]);
            import("keyboard_1.5shrink.stl");
            //import("keyboard_2.5shrink.stl");
        }
        //import("keyboard_switches.stl");
    }
}

module inner()
{
    
    difference()
    {
        import("keyboard_1.5shrink.stl");
        import("keyboard_2.5shrink.stl");
        translate([-100, -100,-1]) cube([200, 200, (bottom+1)-overlap]);
    }
}

union()
{
//    inner();
//    outer();
}
import("keyboard_switches.stl");