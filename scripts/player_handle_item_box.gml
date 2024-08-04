/// player_handle_item_box()
// Get equipped with.... ring?!

var item_box_handle;

// Nearest item box:
item_box_handle = instance_nearest(x, y, par_item_box);

// Exit if there's no nearest handle:
if (item_box_handle == noone) {
    exit;
}

// Break item box:
if (player_collision_prop(item_box_handle, SIDE_MAIN) || player_collision_prop(item_box_handle, SIDE_MAIN, 2)) {
    if (input_cpu == false) {
        // Destroy:
        with (item_box_handle) {
            player_handle = other.id;
            effect_create(ctl_explosion_small, x, y);
            instance_destroy();
        }
    
        // Play sound:
        sound_play("snd_destroy");
    }
}
