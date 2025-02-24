/// audio_stop_sfx(sound)
/// @desc Stops a sound. Accepts sound instances.
/// @param {string} sound
/// @returns {void}

var _sound; _sound = argument0;

if (sound_exists(_sound)) sound_stop(_sound);