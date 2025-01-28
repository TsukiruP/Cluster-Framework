/// player_reaction_ring(obj, interaction)
/* Nom nom nom. */

var reaction_handle, interaction;

reaction_handle = argument0;
interaction = argument1;

if (interaction & INTERACT_MUTUAL)
{
    if (status_invin != INVIN_HURT || (status_invin == INVIN_HURT && status_invin_alarm > 0 && status_invin_alarm < 90))
    {
        if (reaction_handle.super)
        {
            player_add_rings(10);
            audio_play_sfx("snd_ring_super", true);
        }
        else
        {
            player_add_rings(1);
            audio_play_sfx("snd_ring", true, 1, audio_ring_pan());
        }

        with (reaction_handle)
        {
            effect_create(x, y, sequence_ring_sparkle, -depth);
            instance_destroy();
        }
    }
}
