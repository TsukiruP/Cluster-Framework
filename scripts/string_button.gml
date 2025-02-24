/// string_button(button, [style])
/// @desc Returns a string depending on the button.
/// @param {int} button
/// @param {int} [style]
/// @returns {string}

var _button; _button = argument[0];
var _style; if (argument_count > 1) _style = argument[1]; else _style = 0;

return chr(128 + _button + (_style * 18));