/// collision_box_vertical(ox, oy, rot, obj)
// Returns whether the given instance is in collision with a rectangle of size {ox * 2, oy} that rotates with its top edge centered against the calling instance's center point.

var rot, x_int, y_int, sine, csine, x1, y1, x2, y2;

rot = round(argument2 / 90) * 90;
x_int = floor(x);
y_int = floor(y);
sine = dsin(rot);
csine = dcos(rot);

x1 = x_int - (csine * argument0);
y1 = y_int + (sine * argument0);
x2 = x_int + (csine * argument0) + (sine * argument1);
y2 = y_int - (sine * argument0) + (csine * argument1);

return collision_rectangle(x1, y1, x2, y2, argument3, true, true);
