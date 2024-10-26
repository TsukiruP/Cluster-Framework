/// player_reaction_ring(obj, collision)
// Nom nom nom.

var reaction_handle, collision;

reaction_handle = argument0;
collision = argument1;

// Collect ring:
if (collision & COLL_HURT_RADIUS)
{
    if (status_invin != INVIN_HURT || (status_invin == INVIN_HURT && status_invin_alarm > 0 && status_invin_alarm < 90))
    {
        // Collect:
        global.game_rings += 1;

        with (reaction_handle)
        {
            // Sparkle:
            effect_create(ctl_ring_sparkle, x, y, -depth);

            // Destroy:
            instance_destroy();
        }

        // Play sfx:
        sfx_play("snd_ring", true, ctrl_audio.ring_pan);
        ctrl_audio.ring_pan *= -1;
    }
}
