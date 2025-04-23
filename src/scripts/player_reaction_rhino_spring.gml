/// player_reaction_rhino_spring(obj, hitbox)
/// @desc Rhino variant of a spring. Behaves like a Classic spring because the snapping hurts the player.
/// @param {object} obj
/// @param {int} hitbox
/// @returns {void}

var _obj; _obj = argument0;
var _hitbox; _hitbox = argument1;

if (_hitbox & HIT_RADII)
{
    if (spring_inst != _obj || spring_alarm == 0)
    {
        player_reset_spring();
        spring_inst = _obj;
        spring_force = 9;
        spring_angle = angle_wrap(ANGLE_UP - gravity_direction);
        y_speed = -dsin(ANGLE_UP) * spring_force;
        player_set_state(player_state_spring, true);

        with (_obj)
        {
            with (rhino_inst) sequence_set(seq_rhino_spring);

            if (sfx_alarm == 0)
            {
                sfx_alarm = 8;
                audio_play_sfx("snd_spring", true);
            }
        }
    }
}
