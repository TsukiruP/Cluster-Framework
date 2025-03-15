/// player_get_animation_sequence(animation)
/// @desc Returns a sequence from the animation grid.
/// @param {string} animation
/// @returns {script}

var _animation; _animation = argument0;

player_set_animation_variant();
return animation_get(character_index, form_index, animation_variant, _animation);
