/// audio_loop_sfx(sound, [single], [pitch], [pan])
/// @desc Loops a sound.
/// @param {string} sound
/// @param {bool} [single]
/// @param {number} [pitch]
/// @param {number} [pan]
/// @returns {int}

var _sound; _sound = argument[0];
var _single; if (argument_count > 1) _single = argument[1]; else _single = false;
var _pitch; if (argument_count > 2) _pitch = argument[2]; else _pitch = 1;
var _pan; if (argument_count > 3) _pan = argument[3]; else _pan = 0;

with (ctrl_audio)
{
    if (sound_exists(_sound))
    {
        if (sound_get_kind(_sound) == 0)
        {
            if (_single) inst = sound_loop_single_ex(_sound, 1, _pitch, _pan);
            else inst = sound_loop_ex(_sound, 1, _pitch, _pan);

            ds_list_add(sfx_list, inst);
            return inst;
        }
    }

    return noone;
}
