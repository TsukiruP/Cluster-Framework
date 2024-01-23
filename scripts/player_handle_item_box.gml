/// player_handle_item_box()
// Get equipped with.... ring?!

var item_box_handle;

item_box_handle = rectangle_check(hitbox_offset_x, hitbox_offset_y, hitbox_width, hitbox_height, par_item_box); //player_collision_object_main(x, y, par_item_box);

// Break item box:
if (item_box_handle != noone) {
    if (input_cpu == false) {
        with (item_box_handle) {
            player_handle = other.id;
            dummy_effect_create(spr_explosion_small, 0.35, x, y, -5);
            instance_destroy();
        }

        // Play sound:
        sound_play("snd_destroy");
    }
}
