/// player_trait_boost()
/// @desc Dynamite Boost Time!
/// @returns {void}

if (character_index == CHAR_CLASSIC) exit;

var boost_index; boost_index = pick(stage_get_rings() > 10, 0, 1) + min(3, stage_get_rings() / 50);
var boost_threshold;
boost_threshold[0] = 8.0;
boost_threshold[1] = 7.96875;
boost_threshold[2] = 6.5625;
boost_threshold[3] = 5.625;
boost_threshold[4] = 4.21875;

// Have to start at the base values and redo their math:
top_speed = top_speed_temp;
acceleration = acceleration_temp;

if (underwater)
{
    top_speed *= 0.5;
    acceleration *= 0.5;
}
else if (status_speed = SPEED_UP)
{
    top_speed *= 2;
    acceleration *= 2;
}
else if (status_speed == SPEED_SLOW) top_speed *= 0.75;

// Increase acceleration:
if (status_speed != SPEED_SLOW)
{
    acceleration += (2/256) * min(3, stage_get_rings() / 50);
    if (stage_get_rings() > 10) acceleration += (4 / 256);
}

// Boost mode:

if (boost_mode)
{
    if ((on_ground && abs(x_speed) < 4.5) || status_speed == SPEED_SLOW)
    {
        boost_mode = false;
        boost_speed = 0;
    }
    else if (on_ground) boost_speed = boost_threshold[boost_index];
}
else if (on_ground && abs(x_speed) >= top_speed && status_speed != SPEED_SLOW)
{
    if (input_x_direction != 0 && !input_alarm) boost_speed += acceleration;

    if (boost_speed >= boost_threshold[boost_index])
    {
        boost_mode = true;
        camera_set_lag(10);
    }
}
else boost_speed = 0;

// Double top speed if not already doubled:
if (boost_mode && status_speed != SPEED_UP) top_speed *= 2;
