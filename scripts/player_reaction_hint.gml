/// player_reaction_hint(obj, interaction)
/* Press the jump button to jump! */

var reaction_handle, interaction;

reaction_handle = argument0;
interaction = argument1;

if (interaction & INTERACT_MUTUAL)
{
    if (mask_rotation == reaction_handle.gravity_direction && on_ground && !input_cpu)
    {
        if (floor(x_speed) == 0 && player_get_input(INP_UP, CHECK_PRESSED))
        {
            if (hint_allow)
            {
                x_speed = 0;
                hint_allow = false;
                player_set_state(player_state_idle);

                switch (reaction_handle.object_index)
                {
                    case obj_hint_box:
                        player_set_animation("look");
                        audio_play_sfx("snd_hint_monitor", true);
                        break;

                    case obj_omochao:
                        player_set_animation("omochao");
                        break;
                }

                with (reaction_handle) event_user(0);
            }
        }

        with (reaction_handle) player_handle = other.id;
    }
}
