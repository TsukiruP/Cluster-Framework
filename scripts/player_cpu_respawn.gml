/// player_cpu_respawn(player)
/* Respawns the CPU. */

var player_handle;

player_handle = stage_get_player(argument0);

if (instance_exists(player_handle))
{
    if (player_handle.state_current != player_state_death)
    {
        x = floor(player_handle.x);
        y = floor(player_handle.y);
        xprevious = floor(player_handle.x);
        yprevious = floor(player_handle.y);
        image_xscale = player_handle.image_xscale;
        x_speed = player_handle.x_speed;
        y_speed = player_handle.y_speed;
        player_set_state(player_state_air);
        death_alarm = -5;
        status_invin = INVIN_HURT;
        status_invin_alarm = 120;
        drown = false;
        input_cpu_respawn_alarm = 300;
    }
}
