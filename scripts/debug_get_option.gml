/// debug_get_option(option, index, [execute])
/// @desc Executes the current debug option.
/// @param {int} option
/// @param {int} index
/// @param {bool} [execute]
/// @returns bool

var _option; _option = argument[0];
var _index; _index = argument[1];
var _execute; if (argument_count > 2) _execute = argument[2]; else _execute = true;

return script_execute(ds_list_find_value(menu_list, _option), _index, _execute);
