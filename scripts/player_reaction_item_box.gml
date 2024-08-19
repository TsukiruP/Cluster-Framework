/// player_reaction_item_box(obj, collision)
// Get equipped with.... ring?!

var item_box_handle, collision;

// Initialize:
item_box_handle = argument0;
collision       = argument1;

// Break item box:
if ((collision & COLL_HURT) || (collision & COLL_HURT_RADIUS)) {
    // Destroy:
    with (item_box_handle) {
        player_handle = other.id;
        effect_create(ctl_explosion_small, x, y);
        instance_destroy();
    }

    // Play sound:
    sound_play("snd_destroy");
}
