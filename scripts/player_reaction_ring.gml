/// player_reaction_ring(obj, collision)
/* Nom nom nom. */

var reaction_handle, collision;

reaction_handle = argument0;
collision = argument1;

if (collision & COLL_INTERACT)
{
    if (status_invin != INVIN_HURT || (status_invin == INVIN_HURT && status_invin_alarm > 0 && status_invin_alarm < 90))
    {
        if (reaction_handle.super == true)
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
            effect_create(sequence_ring_sparkle, x, y, -depth);
            instance_destroy();
        }
    }
}
