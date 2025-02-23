/// player_cpu_respawn()
/// @desc CPU respawns at player 0.
/// @returns {void}

var player_id; player_id = stage_get_player(0);

if (instance_exists(player_id))
{
    if (player_id.state_current != player_state_death)
    {
        x = floor(player_id.x);
        y = floor(player_id.y);
        xprevious = floor(player_id.x);
        yprevious = floor(player_id.y);
        image_xscale = player_id.image_xscale;
        gravity_direction = player_id.gravity_direction;
        x_speed = player_id.x_speed;
        y_speed = player_id.y_speed;
        layer = player_id.layer;
        status_invin = INVIN_HURT;
        status_invin_alarm = 120;
        underwater = player_id.underwater;
        player_set_state(player_state_air);
        player_set_animation("roll");
        player_set_physics();
    }
}