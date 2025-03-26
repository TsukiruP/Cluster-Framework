/// debug_execute(option, index, [event])
/// @desc Executes the current debug option.
/// @param {int} index
/// @param {bool} [event]
/// @returns bool

var _option; _option = argument[0];
var _index; _index = argument[1];
var _event; if (argument_count > 2) _event = argument[2]; else _event = true;

return script_execute(ds_list_find_value(menu_list, _option), _index, _event);
