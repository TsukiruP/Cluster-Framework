/// debug_menu_screen(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_index)
{
        case MENU_INIT:
            debug_add_option(debug_option_screen_mode);
            debug_add_option(debug_option_screen_ratio);
            debug_add_option(debug_option_screen_scale);
            debug_add_option(debug_option_screen_full);
            return true;

        case MENU_START:
            if (_execute)
            {
                config_reset_screen();
                screen_reset_fullscreen();
                return true;
            }
            else return "Reset";

        case MENU_FUNCTION:
            if (_execute)
            {
                config_write();
                return true;
            }
            else return "Save";

        default:
            return undefined;
}
