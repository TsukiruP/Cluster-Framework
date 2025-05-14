/// player_trait_swap()
/// @desc Reorders the player list. Based off Mania and Trible Trouble 16-bit.
/// @returns {void}

var partner_inst; partner_inst = stage_get_player(1);

if (state_current == player_state_hurt || state_current == player_state_death || !instance_exists(partner_inst)) exit;

if (player_get_input(INP_SWAP, CHECK_PRESSED))
{
    if (tag_leader_state == STATE_FINISH)
    {
        player_reset_tag(true);
        with (partner_inst) player_reset_cpu();
    }
    else if (save_get("swap") && partner_inst.input_cpu_gamepad_alarm == 0)
    {
        if (in_view(partner_inst))
        {
            if (swap_alarm == 0 && status_speed != SPEED_SLOW && status_panic_alarm == 0 && status_swap_alarm == 0 &&
                partner_inst.state_current != player_state_hurt && partner_inst.state_current != player_state_death &&
                partner_inst.state_current != player_state_interlink && partner_inst.state_current != sonic_state_accel)
            {
                with (partner_inst)
                {
                    swap_alarm = 60;
                    status_shield = other.status_shield;
                    status_invin = other.status_invin;
                    status_invin_alarm = other.status_invin;
                    status_speed = other.status_speed;
                    status_speed_alarm = other.status_speed_alarm;
                    player_reset_input();
                    with (instance_create(x, y, eff_swap)) player_inst = other.id;
                }

                player_reset_status();
                player_reset_input();
                classic_trait_clock_up(true);
                input_queue_clear();
                stage_add_player(stage_get_player(0));
                stage_delete_player(0);
                camera_set_focus(stage_get_player(0));
                audio_play_sfx("snd_swap", true);
            }
            else audio_play_sfx("snd_swap_fail", true);
        }
        else
        {
            with (partner_inst)
            {
                if (state_current != player_state_hurt && state_current != player_state_death) player_cpu_respawn();
            }
        }
    }
}
