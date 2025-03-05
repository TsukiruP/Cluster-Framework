/// audio_stop_sfx(sound)
/// @desc Stops a sound. Accepts sound instances.
/// @param {string} sound
/// @returns {void}

var _sound; _sound = argument0;

if (is_real(_sound))
{
    if (sign(_sound) != 1) exit;
}
else if (!sound_exists(_sound)) exit;

sound_stop(_sound);
