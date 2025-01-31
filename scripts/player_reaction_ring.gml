/// player_reaction_ring(obj, hitbox)
/* Nom nom nom. */

var reaction_handle, hitbox;

reaction_handle = argument0;
hitbox = argument1;

if (hitbox & HIT_COLLISION)
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
