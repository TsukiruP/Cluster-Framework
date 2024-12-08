/// player_reaction_item_box(obj, collision)
// Get equipped with.... ring?!

var reaction_handle, collision;

reaction_handle = argument0;
collision = argument1;

// Break item box:
if ((collision & COLL_HURT) || (collision & COLL_HURT_RADIUS))
{
    if (input_cpu == false || (input_cpu == true && input_cpu_alarm > 0))
    {
        // Homing:
        sonic_routine_homing();

        // Get item:
        player_get_item(reaction_handle, reaction_handle.item_id);

        // Play sound:
        audio_sfx_play("snd_destroy", true);

        // Break:
        with (reaction_handle)
        {
            // Link:
            player_handle = other.id;

            // Explode:
            effect_create(ctl_explosion_small, x, y, -depth);

            // Destroy:
            instance_destroy();
        }
    }
}
