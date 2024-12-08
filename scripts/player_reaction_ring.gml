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
        if (reaction_handle.ring_super == true)
        {
            // Add rings:
            stage_add_rings(10);

            // Play sound:
            audio_sfx_play("snd_ring_super", true);
        }
        else
        {
            // Add rings:
            stage_add_rings(1);

            // Play sound:
            audio_sfx_play("snd_ring", true, 1, audio_ring_pan());
        }

        // Destroy:
        with (reaction_handle)
        {
            // Create sparkle:
            effect_create(ctl_ring_sparkle, x, y, -depth);

            // Destroy:
            instance_destroy();
        }
    }
}
