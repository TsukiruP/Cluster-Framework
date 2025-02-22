/// string_bool(value, [toggle])
/// @desc Returns "true" or "false" depending on the value.
/// @param {bool}
/// @param {bool} [toggle] Return "on" or "off" instead.
/// @returns {string}

var _value; _value = argument[0];
var _toggle; if (argument_count > 1) _toggle = argument[1]; else _toggle = false;

if (_toggle) return pick(_value, "Off", "On");
else return pick(_value, "False", "True");