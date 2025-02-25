/// player_get_animation(animation, variant)
/// @desc Returns a sequence from the animation grid.
/// @param {string} animation
/// @param {int} variant
/// @returns {script}

var _animation; _animation = argument0;
var _variant; _variant = argument1;

return animation_get(character_index, _animation, _variant);
