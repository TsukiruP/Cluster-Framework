/// player_skill_sonic()

var skill_slam, skill_homing, skill_peel;

skill_slam = game_save_get_skill(character_id, "slam");
skill_homing = game_save_get_skill(character_id, "homing");
skill_peel = game_save_get_skill(character_id, "peel");

if (skill_slam >= SKILL_BOUND_ATTACK && !on_ground && player_get_input(INP_DOWN, CHECK_HELD) && player_get_input(INP_AUX, CHECK_PRESSED))
{
    switch (skill_slam)
    {
        case SKILL_BOUND_ATTACK:
            return player_set_state(sonic_state_bound);

        case SKILL_STOMP:
            return player_set_state(sonic_state_stomp);
    }
}
else if ((((skill_homing == HOMING_ADVENTURE || skill_homing == HOMING_GENERATIONS) && player_get_input(INP_JUMP, CHECK_PRESSED)) ||
    (skill_homing >= HOMING_UNLEASHED && player_get_input(INP_AUX, CHECK_PRESSED))) && instance_exists(homing_handle))
{
    return player_set_state(sonic_state_homing);
}
else if (on_ground && player_get_input(INP_AUX, CHECK_PRESSED))
{
    var skill_ground;

    skill_ground = game_save_get_skill(character_id, "ground");

    switch (skill_ground)
    {
        case SKILL_HAMMER:
            return player_set_state(player_state_hammer);

        case SKILL_SKID:
            return player_set_state(sonic_state_skid);

    }
}
else if (!on_ground)
{
    var skill_key;

    skill_key = "";

    if (player_get_input(INP_JUMP, CHECK_PRESSED)) skill_key = "air_jump";
    else if (player_get_input(INP_AUX, CHECK_PRESSED)) skill_key = "air_aux";

    if (skill_key != "")
    {
        var skill_air;

        skill_air = game_save_get_skill(character_id, skill_key);

        if (skill_air <= SKILL_INSTA && status_shield_allow)
        {
            var skill_shield;

            skill_shield = game_save_get_skill(character_id, "shield");

            if (skill_shield && status_shield >= SHIELD_BUBBLE) return player_routine_shield();
            else if (skill_air == SKILL_INSTA)
            {
                player_routine_insta();
                return true;
            }
        }
        else if (skill_air == SKILL_AIR_DASH && air_dash_allow)
        {
            x_speed += 2.25 * image_xscale;
            y_speed  = 0;
            air_dash_allow = false;
            animation_skip = (animation_current != "spin" && animation_current != "insta");
            player_set_animation("air_dash");
            audio_play_sfx("snd_air_dash", true);
            return player_set_state(player_state_air, false);
        }
        else if (skill_key == "air_jump")
        {
            if (skill_air == SKILL_DROP_DASH) return player_set_state(sonic_state_drop_dash);
        }
    }
}

if (skill_peel && x_speed == 0 && player_get_input(INP_UP, CHECK_HELD) && player_get_input(INP_JUMP, CHECK_PRESSED))
{
    return player_set_state(sonic_state_peel_out);
}

return false;
