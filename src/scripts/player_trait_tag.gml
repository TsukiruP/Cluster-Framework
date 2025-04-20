/// player_trait_tag()
/// @desc Do you have the courage to ride with the devil?
/// @returns {void}

var partner_inst; partner_inst = stage_get_player(1);

if (!game_save_get("tag") || character_index == CHAR_CLASSIC || input_cpu || !instance_exists(partner_inst))
{
    player_reset_tag(true);
    exit;
}

var tag_allow; tag_allow = false;

if (instance_exists(partner_inst))
{
    switch (state_current)
    {
        case player_state_idle:
        case player_state_turn:
        case player_state_run:
        case player_state_air:
        case player_state_jump:
        case player_state_look:
        case player_state_crouch:
        case player_state_roll:
        case player_state_brake:
        case player_state_ramp:
        case player_state_spring:
            tag_allow = true;
            break;
    }
}

// Leader:
if (tag_allow)
{
    if (!tag_leader)
    {
        if (player_get_input(INP_TAG, CHECK_HELD))
        {
            if (tag_leader_time < 64)
            {
                tag_leader_time += 1;

                // Create effect:
                if (tag_leader_time == 32)
                {
                    audio_play_sfx("snd_tag_call", true);
                    with (instance_create(x, y, eff_tag)) player_inst = other.id;
                }

                // Start arc:
                if (tag_leader_time == 64)
                {
                    with (partner_inst)
                    {
                        if (!in_view(self))
                        {
                            if (x < other.x) x = view_xview[view_current] - 32;
                            else if (x > other.x) x = view_xview[view_current] + screen_get_width() + 32;

                            y = other.y;
                        }

                        image_xscale = esign(other.x - x, 1);
                        x_speed = 0;
                        y_speed = 0;
                        tag_arc_time = 0;
                        tag_arc_offset_x = x - other.x;
                        tag_arc_offset_y = y - other.y;
                        player_set_state(player_state_interlink);
                    }
                }
            }
        } else player_reset_tag(true);
    }
}
else player_reset_tag(true);

// Move partner:
if (partner_inst.state_current == player_state_interlink)
{
    var sine; sine = dsin(mask_direction);
    var csine; csine = dcos(mask_direction);
    var tag_hold; tag_hold = player_get_input(INP_TAG, CHECK_HELD);

    with (partner_inst)
    {

        var tag_leader_offset; tag_leader_offset = 10 * sign(other.image_xscale);
        var tag_leader_x; tag_leader_x = other.x + (csine * tag_leader_offset);
        var tag_leader_y; tag_leader_y = other.y - (sine * tag_leader_offset);

        switch (tag_state)
        {
            // Arc towards leader:
            case 0:
                var tag_arc_max_time; tag_arc_max_time = 32;
                var tag_arc_frame; tag_arc_frame = tag_arc_time / tag_arc_max_time;
                var tag_arc_start_x; tag_arc_start_x = other.x + tag_arc_offset_x;
                var tag_arc_start_y; tag_arc_start_y = other.y + tag_arc_offset_y;
                var tag_arc_end_x; tag_arc_end_x = other.x;
                var tag_arc_end_y; tag_arc_end_y = other.y;
                var tag_arc_center_x; tag_arc_center_x = (tag_arc_end_x + tag_arc_start_x) / 2;
                var tag_arc_center_y; tag_arc_center_y = (tag_arc_end_y + tag_arc_start_y) / 2;
                var tag_arc_x2; tag_arc_x2 = (tag_arc_start_x + tag_arc_center_x) / 2;
                var tag_arc_y2; tag_arc_y2 = min((tag_arc_start_y + tag_arc_center_y) / 2, tag_arc_start_y - 32);
                var tag_arc_x3; tag_arc_x3 = (tag_arc_end_x + tag_arc_center_x) / 2;
                var tag_arc_y3; tag_arc_y3 = min((tag_arc_end_y + tag_arc_center_y) / 2, tag_arc_end_y - 32);

                if (tag_arc_time < tag_arc_max_time) tag_arc_time += 1;
                move_bezier(tag_arc_frame, tag_arc_start_x, tag_arc_start_y, tag_arc_x2, tag_arc_y2, tag_arc_x3, tag_arc_y3, tag_arc_end_x, tag_arc_end_y);

                if (x == tag_arc_end_x && y == tag_arc_end_y)
                {
                    if (tag_allow && tag_hold)
                    {
                        tag_state = 1;
                        other.tag_leader = true;
                        audio_play_sfx("snd_tag_catch", true);
                    }
                    else player_reset_cpu();
                }
                break;

            // Stick to leader:
            case 1:
                x = tag_leader_x;
                y = tag_leader_y;
                image_xscale = sign(other.image_xscale);

                // Reset:
                if (!tag_allow || !other.tag_leader) player_reset_cpu();

                // Execute Tag Action:
                else if (!tag_hold)
                {
                    switch (character_index)
                    {
                        // Sonic Accelerator
                        default:
                            player_reset_cpu();
                            audio_play_sfx("snd_sonic_accel", true);

                            with (other)
                            {
                                boost_mode = true;
                                player_trait_boost(true);
                                x_speed = max(abs(x_speed), top_speed) * image_xscale;
                                player_reset_tag(true);
                            }
                    }
                }
                break;
        }
    }
}
