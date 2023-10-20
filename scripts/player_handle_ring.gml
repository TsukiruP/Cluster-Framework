/// player_handle_ring()
// Nom nom nom.

var ring_handle;

// Collect ring:
ring_handle = player_collision_object_main(x, y, obj_ring);

if(ring_handle != noone) {
    if(invincibility_type != 1 || (invincibility_type == 1 && invincibility_alarm > -1 && invincibility_type <= 90)) {
        if(action_state != ACTION_HURT) {
            if(control_type == 1 || (control_type == 2 && global.player_id[0].action_state != ACTION_HURT)) {
                with(ring_handle) {
                    dummy_effect_create(spr_ring_sparkle, 0.35, x, y, -10);
                    instance_destroy();
                }

                // Add to stage rings:
                global.stage_rings += 1;

                // Play sound:
                sound_play_single("snd_ring");
                ctrl_audio.ring_pan *= -1;
            }
        }
    }
}
