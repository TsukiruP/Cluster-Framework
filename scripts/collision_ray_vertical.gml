/// collision_ray_vertical(ox, oy, rot, obj)
// Returns whether the given instance is in collision with a line of height {oy * 2} and length {ox} from the calling instance's center point.

var x_int, y_int, sine, csine, x1, y1, x2, y2;

x_int = floor(x);
y_int = floor(y);
sine  = dsin(argument2);
csine = dcos(argument2);

x1 = x_int + (csine * argument0) - (sine * argument1);
y1 = y_int - (sine * argument0) - (csine * argument1);
x2 = x_int + (csine * argument0) + (sine * argument1);
y2 = y_int - (sine * argument0) + (csine * argument1);

return collision_line(x1, y1, x2, y2, argument3, true, true);
