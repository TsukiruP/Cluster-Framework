/// player_handle_item_box()
// Get equipped with.... ring?!

var item_box_handle;

// Nearest item box:
item_box_handle = instance_nearest(x, y, par_item_box);

if (item_box_handle == noone) exit;

// Break item box:
if (player_collision_prop(item_box_handle, SIDE_MAIN) != 0 || player_collision_prop(item_box_handle, SIDE_MAIN, 1) != 0) {
    if (input_cpu == false) {
        // Destroy item box:
        with (item_box_handle) {
            player_handle = other.id;
            //particle_create(EFFECT_EXPL_SM, x, y);
            instance_destroy();
        }

        // Play sound:
        sound_play("snd_destroy");
    }
}
