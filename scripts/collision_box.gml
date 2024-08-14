/// collision_box(ox, oy, invert, obj)
// Returns whether the given instance is in collision with a rectangle of size {ox * 2, oy * 2} centered on the calling instance.

var x_int, y_int;

x_int = floor(x);
y_int = floor(y);

if (argument2) {
    return collision_rectangle(x_int - argument1, y_int - argument0, x_int + argument1, y_int + argument0, argument3, true, true);
}

return collision_rectangle(x_int - argument0, y_int - argument1, x_int + argument0, y_int + argument1, argument3, true, true);
