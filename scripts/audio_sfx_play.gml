/// audio_sfx_play(index, [single, pitch, pan])
// Plays a sound.

// Check if index exists:
if (sound_exists(argument0))
{
    // Check index kind:
    if (sound_get_kind(argument0) == 0)
    {
        var single, pitch, pan;

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
            // Return:
            return sound_play_single_ex(argument0, 1, pitch, pan);
        }
        else
        {
            // Return:
            return sound_play_ex(argument0, 1, pitch, pan);
        }
    }
}
else
{
    return noone;
}
