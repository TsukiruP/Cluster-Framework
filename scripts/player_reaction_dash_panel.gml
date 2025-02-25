/// player_reaction_dash_panel(obj, hitbox)
/// @desc
/// @param {object} obj
/// @param {int} hitbox
/// @returns {void}

var _obj; _obj = argument0;
var _hitbox; _hitbox = argument1;

if (_hitbox & HIT_INTERACT)
{
    if (dash_panel_inst != _obj || input_lock_alarm == 0)
    {
        if (gravity_direction != _obj.angle)
        {
            mask_direction = _obj.angle;
            player_set_state(player_state_run);
        }

        image_xscale = pick(_obj.variant, _obj.image_xscale, _obj.image_yscale);
        x_speed = _obj.force * image_xscale;
        input_lock_alarm = 16;
        dash_panel_inst = _obj;

        with (_obj)
        {
            if (sfx_alarm == 0)
            {
                sfx_alarm = 8;
                audio_play_sfx("snd_dash_panel", true);
            }
        }
    }
}
