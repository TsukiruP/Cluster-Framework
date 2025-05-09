/// debug_menu_sonic(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_index)
{
        case MENU_INIT:
            debug_add_option(debug_option_sonic_ground);
            debug_add_option(debug_option_sonic_air_jump);
            debug_add_option(debug_option_sonic_air_aux);
            debug_add_option(debug_option_sonic_slam);
            debug_add_option(debug_option_sonic_peel);
            debug_add_option(debug_option_sonic_homing);
            debug_add_option(debug_option_sonic_shield);
            return true;

        default:
            return undefined;
}