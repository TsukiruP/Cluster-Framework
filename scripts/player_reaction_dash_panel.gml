/// player_reaction_dash_panel(inst, hitbox)
/// @desc
/// @param {object} inst
/// @param {int} hitbox
/// @returns {void}

var _inst; _inst = argument0;
var _hitbox; _hitbox = argument1;

if (_hitbox & HIT_COLLISION)
{
    if (dash_panel_inst != _inst || input_lock_alarm == 0)
    {
        if (gravity_direction != _inst.angle)
        {
            mask_rotation = _inst.angle;
            player_set_state(player_state_run);
        }

        //image_xscale = _inst.image_xscale;
        image_xscale = pick(_inst.variant, _inst.image_xscale, _inst.image_yscale);
        x_speed = _inst.force * image_xscale;
        input_lock_alarm = 16;
        dash_panel_inst = _inst;

        with (_inst)
        {
            if (sfx_alarm == 0)
            {
                sfx_alarm = 8;
                audio_play_sfx("snd_dash_panel", true);
            }
        }
    }
}
