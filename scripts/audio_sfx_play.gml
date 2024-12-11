/// audio_sfx_play(index, [single, pitch, pan])
// Plays a sound.

with (mgr_audio)
{
    // Check if index exists:
    if (sound_exists(argument0))
    {
        // Check index kind:
        if (sound_get_kind(argument0) == 0)
        {
            var single, pitch, pan, inst;

            // Initialize:
            single = false;
            pitch = 1;
            pan = 0;

            // Set single:
            if (argument_count >= 2)
            {
                single = argument[1];
            }

            // Set pitch:
            if (argument_count >= 3)
            {
                pitch = argument[2];
            }

            // Set pan:
            if (argument_count >= 4)
            {
                pan = argument[3];
            }

            // Play sound:
            if (single == true)
            {
                inst = sound_play_single_ex(argument0, 1, pitch, pan);
            }
            else
            {
                inst = sound_play_ex(argument0, 1, pitch, pan);
            }

            ds_list_add(sfx_list, inst);

            return inst;
        }
    }
    else
    {
        return noone;
    }
}
