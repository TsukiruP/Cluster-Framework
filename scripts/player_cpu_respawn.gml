/// player_cpu_respawn()
/// @desc CPU respawns at player 0.
/// @returns {void}

var player_inst; player_inst = stage_get_player(0);

if (instance_exists(player_inst))
{
    if (player_inst.state_current != player_state_death)
    {
        player_reset_cpu();
        status_invin = INVIN_HURT;
        status_invin_alarm = 120;
    }
}
