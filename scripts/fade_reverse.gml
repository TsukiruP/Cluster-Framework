/// fade_reverse(fade)
/// @desc Inverts the speed and target of the fade.
/// @param {object} fade
/// @returns {void}

var _fade; _fade = argument0;

with (_fade)
{
    fade_speed *= -1;
    fade_target *= -1;
}