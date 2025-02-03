/// sonic_skill_air()
/* Returns whether an air skill has been called. */

if (!on_ground)
{
    var skill_key;

    if (player_get_input(INP_JUMP, CHECK_PRESSED)) skill_key = "air_jump";
    else if (player_get_input(INP_AUX, CHECK_PRESSED)) skill_key = "air_aux";
    else skill_key = "";

    if (skill_key != "")
    {
        var skill_index;

        skill_index = game_save_get_skill(character_index, skill_key);

        if (skill_index <= SKILL_INSTA && status_shield_allow)
        {
            var skill_shield;

            skill_shield = game_save_get_skill(character_index, "shield");

            if (skill_shield && status_shield >= SHIELD_BUBBLE) return player_routine_shield();
            else if (skill_index == SKILL_INSTA)
            {
                player_routine_insta();
                return true;
            }
        }
        else if (skill_index == SKILL_AIR_DASH && air_dash_allow)
        {
            x_speed += 2.25 * image_xscale;
            y_speed  = 0;
            air_dash_allow = false;
            animation_skip = (animation_current != "roll" && animation_current != "spin_flight" && animation_current != "insta");
            player_set_animation("air_dash");
            audio_play_sfx("snd_air_dash", true);
            return player_set_state(player_state_air, false);
        }
        else if (skill_key == "air_jump")
        {
            if (skill_index == SKILL_DROP_DASH) return player_set_state(sonic_state_drop_dash);
        }
    }
}

return false;
