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
        if (state_current == sonic_state_homing)
        {
            // Set state:
            x_speed = 0;
            jump_aux = (global.skill_sonic[SONIC_HOMING] >= HOMING_UNLEASHED);
            animation_skip = true;
            player_set_state(player_state_jump);
        }

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
