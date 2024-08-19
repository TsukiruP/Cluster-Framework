/// player_collision_object(obj)
// Returns whether the player is colliding with an object.

var x_int, y_int, object_handle, left, top, right, bottom, off_x, off_y, dir, rot, x1, y1, x2, y2;;

// Initialize:
x_int         = floor(x);
y_int         = floor(y);
object_handle = instance_nearest(x_int, y_int, argument0);

/*

p_left   = argument0;
p_top    = argument1;
p_right  = argument2;
p_bottom = argument3;

p_off_x  = argument4 * argument6;
p_off_y  = argument5;

p_dir    = argument6;
p_rot    = round(argument7 / 90) * 90;
