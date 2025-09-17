/// player_reaction_goal_ring(obj, hitbox)
/// @desc GOAAAAAAAAAAAAAAAAAAAAAAAAAAAAL!!!
/// @param {object} obj
/// @param {int} hitbox
/// @returns {void}

var _obj; _obj = argument0;
var _hitbox; _hitbox = argument1;

if ((_hitbox & HIT_INTERACT) && !_obj.goal_state && !input_cpu)
{
    with (_obj)
    {
        goal_state = 1;
        spin_count = clamp(floor(other.x_speed * 2), 3, 20);
        audio_play_sfx("snd_sign_post");
        audio_stop_jng();
        stage_set_pause_allow(false);
        stage_set_time_allow(false);
        camera_set_focus(self.id);
        camera_set_lag(0);
        hud_set_hide(true);

        with (ctrl_camera)
        {
            camera_x_shift = 0;
            camera_y_shift = 0;
        }

        with (obj_player)
        {
            input_allow = false;
            player_reset_status();
            player_reset_input();
            player_set_input(pick(other.image_xscale == 1, INP_LEFT, INP_RIGHT), CHECK_HELD, true);
        }
    }
}
