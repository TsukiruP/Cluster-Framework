/// audio_play_sfx(index, [single, pitch, pan])
/* Plays a sound.
If the index doesn't exist or isn't the correct kind, returns noone. */

with (ctrl_audio)
{
    if (sound_exists(argument0))
    {
        if (sound_get_kind(argument0) == 0)
        {
            var single, pitch, pan, inst;

            single = false;
            pitch = 1;
            pan = 0;

            if (argument_count > 1) single = argument[1];
            if (argument_count > 2) pitch = argument[2];
            if (argument_count > 3) pan = argument[3];

            if (single) inst = sound_play_single_ex(argument0, 1, pitch, pan);
            else inst = sound_play_ex(argument0, 1, pitch, pan);

            ds_list_add(sfx_list, inst);
            return inst;
        }
    }

    return noone;
}
