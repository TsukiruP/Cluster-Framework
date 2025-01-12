/// player_trait_swap()
/*  */

if (state_current == player_state_hurt || state_current == player_state_death || !instance_exists(stage_get_player(1)))
{
    exit;
}

var partner_handle;

partner_handle = stage_get_player(1);

if (partner_handle.input_cpu_gamepad_alarm > 0)
{
    exit;
}

if (player_get_input(INP_SWAP, CHECK_PRESSED))
{
    if (in_view(partner_handle))
    {
        if (swap_alarm == 0 && status_speed != SPEED_SLOW && status_panic == false && status_swap == false &&
            partner_handle.state_current != player_state_hurt && partner_handle.state_current != player_state_death)
        {
            with (partner_handle)
            {
                swap_alarm = 60;
                status_shield = other.status_shield;
                status_invin = other.status_invin;
                status_invin_alarm = other.status_invin;
                status_speed = other.status_speed;
                status_speed_alarm = other.status_speed_alarm;
                player_reset_input();

                with (instance_create(x, y, eff_swap))
                {
                    player_handle = other.id;
                }
            }

            player_reset_status();
            player_reset_input();
            input_queue_clear();
            stage_add_player(stage_get_player(0));
            stage_delete_player(0);
            camera_set_focus(stage_get_player(0));
            audio_play_sfx("snd_swap", true);
        }
        else
        {
            audio_play_sfx("snd_swap_fail", true);
        }
    }
    else
    {
        with (partner_handle)
        {
            if (state_current != player_state_hurt && state_current != player_state_death)
            {
                player_cpu_respawn();
            }
        }
    }
}
