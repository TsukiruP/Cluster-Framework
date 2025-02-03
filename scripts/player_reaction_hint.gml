/// player_reaction_hint(obj, hitbox)
/* Press the jump button to jump! */

var reaction_id, hitbox;

reaction_id = argument0;
hitbox = argument1;

if (hitbox & HIT_COLLISION)
{
    if (mask_rotation == reaction_id.gravity_direction && on_ground && !input_cpu)
    {
        if (floor(x_speed) == 0 && player_get_input(INP_UP, CHECK_PRESSED))
        {
            if (hint_allow)
            {
                x_speed = 0;
                hint_allow = false;
                player_set_state(player_state_idle);

                switch (reaction_id.object_index)
                {
                    case obj_hint_box:
                        player_set_animation("look");
                        audio_play_sfx("snd_hint_monitor", true);
                        break;

                    case obj_omochao:
                        player_set_animation("omochao");
                        break;
                }

                with (reaction_id) event_user(0);
            }
        }

        with (reaction_id) player_id = other.id;
    }
}
