/// player_reaction_hint(obj, hitbox)
/// @desc Press the jump button to jump!
/// @param {object} obj
/// @param {int} hitbox
/// @param {void}

var _obj; _obj = argument0;
var _hitbox; _hitbox = argument1;

if (_hitbox & HIT_INTERACT)
{
    if (mask_direction == _obj.gravity_direction && on_ground && tag_leader_state != STATE_FINISH && !input_cpu)
    {
        if (floor(x_speed) == 0 && player_get_input(INP_UP, CHECK_PRESSED))
        {
            if (hint_allow)
            {
                x_speed = 0;
                hint_allow = false;
                player_set_state(player_state_idle);

                switch (_obj.object_index)
                {
                    case obj_hint_box:
                        player_set_animation("look");
                        audio_play_sfx("snd_hint_monitor", true);
                        break;

                    case obj_omochao:
                        player_set_animation("omochao");
                        break;
                }

                with (_obj) event_user(0);
            }
        }

        with (_obj) player_inst = other.id;
    }
}
