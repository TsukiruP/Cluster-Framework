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

        // Play sound:
        sound_play("snd_destroy");
    }
}
