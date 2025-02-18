/// camera_set_lag(value)
/// @desc Sets the camera's lag.
/// @param {int} value
/// @returns {void}

var _value; _value = argument0;

with (ctrl_camera) camera_lag_alarm = _value;
