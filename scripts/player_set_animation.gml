/// player_set_animation(animation, [moment])
/// @desc Sets the player's animation.
/// @param {string} animation
/// @param {int} [moment]
/// @returns {void}

var _animation; _animation = argument[0];
var _moment; if (argument_count > 1) _moment = argument[1]; else _moment = 0;

if (animation_current != _animation || argument_count > 1)
{
    animation_previous = animation_current;
    animation_current = _animation;
    animation_changed = true;
    animation_moment = _moment;
    player_animation_core();
}