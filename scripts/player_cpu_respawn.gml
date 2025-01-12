/// player_cpu_respawn()
/* Respawns the CPU. */

var player_handle;

player_handle = stage_get_player(0);

if (instance_exists(player_handle))
{
    if (player_handle.state_current != player_state_death)
    {
        x = floor(player_handle.x);
        y = floor(player_handle.y + player_handle.y_radius);
        xprevious = floor(player_handle.x);
        yprevious = floor(player_handle.y);
        image_xscale = player_handle.image_xscale;
        x_speed = player_handle.x_speed;
        y_speed = player_handle.y_speed;
        player_set_state(player_state_air);
        status_invin = INVIN_HURT;
        status_invin_alarm = 120;
    }
}
