/// character_handle_monitor()
// Get equipped with.... ring?!

var monitor_handle;

// Break monitor:
monitor_handle = character_collision_object_main(x, y, par_monitor);

if(monitor_handle != noone) {
    with(monitor_handle) {
        character_handle = other.id;
        dummy_effect_create(spr_explosion_small, 0.35, x, y, -5);
        instance_destroy();
    }

    // Play sound:
    sound_play("snd_monitor");
}
