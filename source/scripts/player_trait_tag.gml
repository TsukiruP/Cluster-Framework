/// player_trait_tag()
/// @desc Do you have the courage to ride with the devil?
/// @returns {void}

var partner_inst; partner_inst = stage_get_player(1);

if (!save_get("tag") || character_index == CHAR_CLASSIC || input_cpu || !instance_exists(partner_inst))
{
    player_reset_tag(true);
    exit;
}

var tag_allow; tag_allow = false;

if (!(relative_angle >= 45 && relative_angle <= 315) && instance_exists(partner_inst))
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
if (player_get_input(INP_TAG, CHECK_HELD))
{
    if (tag_leader_time < 64) tag_leader_time += 1;
}
else
{
    if (tag_leader_time != 0) tag_leader_time = 0;
    if (tag_leader_state == STATE_STEP) tag_leader_state = STATE_START;
}

if (tag_allow)
{
    if (tag_leader_state == STATE_START)
    {
        // Create effect:
        if (tag_leader_time >= 32)
        {
            tag_leader_state = STATE_STEP;
            audio_play_sfx("snd_tag_call", true);
            with (instance_create(x, y, eff_tag)) player_inst = other.id;
        }
    }

    if (tag_leader_state == STATE_STEP)
    {
        // Call partner:
        if (tag_leader_time >= 64 && partner_inst.state_current != player_state_interlink)
        {
            with (partner_inst)
            {
                if (!in_view(self))
                {
                    if (x > other.x) x = view_xview[view_current] + screen_get_width() + 32;
                    else x = view_xview[view_current] - 32;

                    y = other.y;
                }

                image_xscale = esign(other.x - x, 1);
                x_speed = 0;
                y_speed = 0;
                tag_arc_time = 0;
                tag_arc_x_offset = x - other.x;
                tag_arc_y_offset = y - other.y;
                player_set_state(player_state_interlink);
            }
        }
    }
}
else tag_leader_state = STATE_START;

// Partner:
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
                var tag_arc_start_x; tag_arc_start_x = other.x + tag_arc_x_offset;
                var tag_arc_start_y; tag_arc_start_y = other.y + tag_arc_y_offset;
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
                        other.tag_leader_state = STATE_FINISH;
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
                if (!tag_allow || other.tag_leader_state != STATE_FINISH) player_reset_cpu();

                // Execute Tag Action:
                else if (!tag_hold)
                {
                    player_reset_cpu();

                    if (character_index != other.character_index)
                    {
                        switch (character_index)
                        {
                            case CHAR_MILES:
                                // Leap Jump:
                                if (other.on_ground)
                                {
                                    player_set_state(miles_state_jump_box);
                                    with (other) player_set_state(player_state_leap_frog);
                                }

                                // Propeller Catch:
                                else
                                {
                                    x = floor(other.x);

                                    if (!collision_box_vertical(x_radius, y_radius + 32, mask_direction, par_solid))
                                    {
                                        fly_carry = true;
                                        fly_hammer = -1;
                                        player_set_state(miles_state_fly);

                                        with (other)
                                        {
                                            x = floor(other.x) + (sine * 32);
                                            y = floor(other.y) + (csine * 32);
                                            player_set_state(player_state_fly_carry);
                                        }
                                    }
                                    else player_set_state(player_state_air);
                                }
                                break;

                            // Sonic Accelerator:
                            default:
                                player_set_state(sonic_state_accel);
                                x = floor(other.x) + (sine * (other.y_radius - y_radius));
                                y = floor(other.y) + (csine * (other.y_radius - y_radius));;
                                on_ground = other.on_ground;
                                audio_play_sfx("snd_sonic_accel", true);

                                with (other)
                                {
                                    boost_mode = true;
                                    player_trait_boost(true);
                                    x_speed = max(abs(x_speed), top_speed) * image_xscale;
                                    if (!on_ground) player_set_animation("spin_flight");
                                }
                        }
                    }

                    with (other) player_reset_tag(true);
                }
                break;
        }
    }
}
