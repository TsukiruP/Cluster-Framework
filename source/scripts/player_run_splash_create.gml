/// player_run_splash_create()
/// @desc Creates a running splashes.
/// @returns {void}

if (!underwater)
{
    var surface_inst; surface_inst = collision_point(x, floor(y) + y_radius + 1, obj_water_mask, false, false);

    if (on_ground && abs(x_speed) > 0 && surface_inst != noone)
    {
        surface_alarm -= 1;

        if (surface_alarm <= 0)
        {
            surface_alarm = 8;
            if (instance_exists(ground_inst)) effect_create(x, surface_inst.y, pick(abs(x_speed) >= 4.50, seq_splash_3, seq_splash_4), depth, sign(x_speed));
            else effect_create(x, surface_inst.y, seq_splash_5, depth, sign(x_speed));
        }
    }
    else surface_alarm = 0;
}
