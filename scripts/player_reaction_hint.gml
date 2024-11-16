/// player_reaction_hint(obj, collision)
// Press the jump button to jump!

var reaction_handle, collision;

reaction_handle = argument0;
collision = argument1;

// Activate hint:
if (collision & COLL_HURT_RADIUS)
{
    if (mask_rotation == reaction_handle.gravity_direction && on_ground == true && input_cpu == false)
    {
        // Link:
        with (reaction_handle)
        {
            player_handle = other.id;
        }

        // Activate:
        if (floor(x_speed) == 0 && player_get_input(INP_UP, CHECK_PRESSED))
        {
            // Set state:
            if (hint_allow == true)
            {
                // Set state:
                player_set_state(player_state_idle);

                // Set speed:
                x_speed = 0;

                //
                hint_allow = false;

                // Set animation:
                switch (reaction_handle.object_index)
                {
                    // Hint Box:
                    case obj_hint_box:
                        player_set_animation("look");
                        break;

                        // Omochao:
                    case obj_omochao:
                        player_set_animation("omochao");
                        break;
                }

                // Call text:
                with (reaction_handle)
                {
                    event_user(0);
                }
            }
        }
    }
}
