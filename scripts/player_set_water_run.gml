/// player_set_water_run()
/// @desc Sets the player's ground variables for water running.
/// @returns {void}

if (angle != ANGLE_RIGHT) exit;

var hit_water; hit_water = instance_nearest(x, y, obj_water_mask);

if (hit_water != noone)
{
    if (abs(x_speed) >= 6 && floor(y) + y_radius == hit_water.bbox_top -1)
    {
        on_ground = true;
        ground_inst = noone;
    }
}
