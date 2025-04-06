/// debug_menu_config(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_index)
{
        case MENU_INIT:
            debug_add_option(debug_option_interface);
            debug_add_option(debug_option_screen);
            debug_add_option(debug_option_audio);
            debug_add_option(debug_option_keyboard);
            debug_add_option(debug_option_gamepad);
            debug_add_option(debug_option_gameplay);
            debug_add_option(debug_option_advance);
            debug_add_option(debug_option_misc);
            break;
        
        default:
            return false;
}

return true;