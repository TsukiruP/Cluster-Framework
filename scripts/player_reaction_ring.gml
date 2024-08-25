/// player_reaction_ring(obj, collision)
// Nom nom nom.

var reaction_handle, collision;

reaction_handle = argument0;
collision       = argument1;

// Collect ring:
if (collision & COLL_HURT_RADIUS) {
    if (status_invin != INVIN_HURT || (status_invin == INVIN_HURT && status_invin_alarm > 0 && status_invin_alarm < 90)) {
        // Add to total:
        global.game_rings += 1;

        // Destroy:
        with (reaction_handle) {
            effect_create(ctl_ring_sparkle, x, y, -depth);
            instance_destroy();
        }

        // Play sound:
        sound_play_single("snd_ring");
        ctrl_audio.ring_pan *= -1;
    }
}
