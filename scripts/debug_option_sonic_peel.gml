/// debug_option_sonic_peel(return)

var skill_key;

skill_key = "peel";

switch (argument0)
{
    // Text:
    case 0:
        return "Peel Out:";

    // Value:
    case 1:
        return string_bool(game_save_get_skill(CHAR_SONIC, skill_key), true);

    // Update:
    case 3:
        game_save_set_skill(CHAR_SONIC, skill_key, !game_save_get_skill(CHAR_SONIC, skill_key));
        return true;

    // Undefined:
    default:
        return undefined;
}
