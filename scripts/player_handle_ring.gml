/// player_handle_ring()
// Nom nom nom.

var ring_handle;

// Nearest ring:
ring_handle = instance_nearest(x, y, par_ring);

// Exit if there's no nearest handle:
if (ring_handle == noone) {
    exit;
}

// Collect ring:
if (player_collision_prop(ring_handle, SIDE_MAIN) != 0) {
    if (status_invin != INVIN_HURT || (status_invin == INVIN_HURT && status_invin_alarm > 0 && status_invin_alarm < 90)) {
        // Destroy ring:
        with (ring_handle) {
            effect_create(ctl_ring_sparkle, x, y, depth - 1);
            instance_destroy();
        }

        // Add to ring total:
        global.game_rings += 1;

        // Play sound:
        sound_play_single("snd_ring");
        ctrl_audio.ring_pan *= -1;
    }
}
