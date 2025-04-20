/// debug_menu_data(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_index)
{
        case MENU_INIT:
            debug_add_option(debug_option_save_write);
            debug_add_option(debug_option_save_read);
            debug_add_option(debug_option_save_delete);
            debug_add_option(debug_option_save_rename);
            debug_add_option(debug_option_save_reset);
            debug_add_option(debug_option_config_write);
            debug_add_option(debug_option_config_read);
            debug_add_option(debug_option_config_reset);
            return true;

        default:
            return undefined;
}
