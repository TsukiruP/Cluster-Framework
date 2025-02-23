/// angle_wrap(angle)
/// @desc Returns an equivalent angle between 0-360.
/// @param {number} angle
/// @returns {int}

var _angle; _angle = argument0;

return ((_angle mod 360) + 360) mod 360;