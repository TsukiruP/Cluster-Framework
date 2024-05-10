/// player_handle_ring()
// Nom nom nom.
/*
var ring_handle;

// Nearest ring:
ring_handle = instance_nearest(x, y, par_ring);

if (ring_handle == noone) exit;

// Collect ring:
if (player_collision_prop(SIDE_MAIN, ring_handle) != 0) {
    if (invincibility_type != 1 || (invincibility_type == 1 && invincibility_alarm > -1 && invincibility_type <= 90)) {
        if (action_state != ACTION_HURT) {
            // Destroy ring:
            with (ring_handle) {
                effect_create(ctl_ring_sparkle, x, y);
                instance_destroy();
            }

            // Add to ring count:
            global.game_rings += 1;

            // Play sound:
            sound_play_single("snd_ring");
            ctrl_audio.ring_pan *= -1;
        }
    }
}
