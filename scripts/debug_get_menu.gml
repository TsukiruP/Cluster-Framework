/// debug_get_menu(index, [execute])
/// @desc Returns an aspect of the menu.
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

return script_execute(menu_index, _index, _execute);
