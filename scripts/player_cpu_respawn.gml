/// player_cpu_respawn()
/// @desc CPU respawns at player 0.
/// @returns {void}

var player_inst; player_inst = stage_get_player(0);

if (instance_exists(player_inst))
{
    if (player_inst.state_current != player_state_death)
    {
        x = floor(player_inst.x);
        y = floor(player_inst.y);
        xprevious = floor(player_inst.x);
        yprevious = floor(player_inst.y);
        image_xscale = player_inst.image_xscale;
        gravity_direction = player_inst.gravity_direction;
        x_speed = player_inst.x_speed;
        y_speed = player_inst.y_speed;
        layer = player_inst.layer;
        status_invin = INVIN_HURT;
        status_invin_alarm = 120;
        underwater = player_inst.underwater;
        player_set_state(player_state_air);
        player_set_animation("roll");
        player_set_physics();
    }
}
