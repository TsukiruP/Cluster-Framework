/// string_bool(val, [toggle])
/// @desc Returns "true" or "false" depending on the value.
/// @param {bool} val
/// @param {bool} [toggle] Return "on" or "off" instead.
/// @returns {string}

var _val; _val = argument[0];
var _toggle; if (argument_count > 1) _toggle = argument[1]; else _toggle = false;

if (_toggle) return pick(_val, "Off", "On");
else return pick(_val, "False", "True");