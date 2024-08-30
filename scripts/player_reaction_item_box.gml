/// player_reaction_item_box(obj, collision)
// Get equipped with.... ring?!

var reaction_handle, collision;

reaction_handle = argument0;
collision       = argument1;

// Break item box:
if ((collision & COLL_HURT) || (collision & COLL_HURT_RADIUS)) {
    if (input_cpu == false || (input_cpu == true && input_cpu_alarm > 0)) {
        // Link:
        reaction_handle.player_handle = self.id;

        // Explode:
        effect_create(ctl_explosion_small, reaction_handle.x, reaction_handle.y, -reaction_handle.depth);

        // Destroy:
        instance_destroy_id(reaction_handle);

        // Play sound:
        sound_play("snd_destroy");
    }
}
