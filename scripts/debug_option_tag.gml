/// debug_option_tag(return)
/// @param {int} return
/// @returns {any}

var _return; _return = argument0;

var save_key; save_key = "tag";

switch (_return)
{
    // Text:
    case 0:
        return "Tag:";

    // Value:
    case 1:
        return string_bool(game_get_save(save_key), true);

    // Update:
    case 3:
        game_set_save(save_key, !game_get_save(save_key));
        return true;

    // Undefined:
    default:
        return undefined;
}
