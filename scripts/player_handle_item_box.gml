/// player_handle_item_box()
// Get equipped with.... ring?!

var item_box_handle;

// Nearest item box:
item_box_handle = instance_nearest(x, y, par_item_box);

if (item_box_handle == noone) exit;

// Break item box:
if (player_collision_prop(SIDE_MAIN, item_box_handle) != 0 || player_rectangle_check(hitbox_width, hitbox_height, hitbox_offset_x * animation_direction, hitbox_offset_y * animation_direction, item_box_handle)) {
    if (input_cpu == false) {
        with (item_box_handle) {
            player_handle = other.id;
            instance_destroy();
        }

        // Play sound:
        sound_play("snd_destroy");
    }
}
