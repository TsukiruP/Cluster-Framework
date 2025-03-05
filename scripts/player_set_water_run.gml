/// player_set_water_run()
/// @desc Sets the player's ground variables for water running.
/// @returns {void}

if (mask_direction != ANGLE_RIGHT) exit;

var x_int; x_int = floor(x);
var y_int; y_int = floor(y);

var hit_water; hit_water = collision_rectangle(x_int - x_radius, y_int, x_int + x_radius, y_int + y_radius + 1, obj_water_mask, true, false);

if (hit_water != noone)
{
    if (abs(x_speed) >= 6 && y_int + y_radius == hit_water.bbox_top -1)
    {
        on_ground = true;
        ground_inst = noone;
    }
}
