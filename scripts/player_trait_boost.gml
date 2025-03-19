/// player_trait_boost([tag])
/// @desc Dynamite Boost Time!
/// @param {bool} [tag]
/// @returns {void}

var _tag; if (argument_count > 0) _tag = argument[0]; else _tag = false;

if (character_index == CHAR_CLASSIC) exit;

var boost_index; boost_index = pick(stage_get_rings() > 10, 0, 1) + min(stage_get_rings() / 50, 3);
var boost_threshold;
boost_threshold[0] = 8.0;
boost_threshold[1] = 7.96875;
boost_threshold[2] = 6.5625;
boost_threshold[3] = 5.625;
boost_threshold[4] = 4.21875;

// Have to start at the base values and redo their math:
player_reset_physics();

// Increase acceleration:
if (boost_mode || status_speed != SPEED_SLOW)
{
    acceleration += (2/256) * min(stage_get_rings() / 50, 3);
    if (stage_get_rings() > 10) acceleration += (4 / 256);
}

// Boost mode:
if (!_tag)
{
    if (boost_mode)
    {
        if ((on_ground && abs(x_speed) < 4.5) || status_speed == SPEED_SLOW)
        {
            boost_mode = false;
            boost_speed = 0;
        }
        else if (on_ground) boost_speed = boost_threshold[boost_index];
    }
    else if (game_get_save("boost") && on_ground && abs(x_speed) >= top_speed && status_speed != SPEED_SLOW)
    {
        if (input_x_direction != 0 && input_allow) boost_speed += acceleration;

        if (boost_speed >= boost_threshold[boost_index])
        {
            boost_mode = true;
            audio_play_sfx("snd_boost_mode", true);
            if (!input_cpu) camera_set_lag(10);
        }
    }
    else boost_speed = 0;
}

// Double top speed if not already doubled:
if (boost_mode && status_speed != SPEED_UP) top_speed *= 2;
