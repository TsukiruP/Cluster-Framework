/// player_reaction_spring(inst, hitbox)
/// @desc
/// @param {object} inst
/// @param {int} hitbox
/// @returns {void}

var _inst; _inst = argument0;
var _hitbox; _hitbox = argument1;

if (_hitbox & HIT_COLLISION)
{
    if (spring_inst != _inst || spring_alarm == 0)
    {
        var is_dash_ring; is_dash_ring = (_inst.object_index == obj_dash_ring);

        player_reset_spring();
        spring_inst = _inst;
        spring_force = spring_inst.force;
        spring_angle = angle_wrap(spring_inst.angle - gravity_direction);
        spring_alarm = spring_force + 15;

        x_speed = dcos(spring_angle) * spring_force;
        y_speed = -dsin(spring_angle) * spring_force;

        if (!(on_ground && (spring_angle == ANGLE_LEFT || spring_angle == ANGLE_RIGHT)) || is_dash_ring)
        {
            y = _inst.y;
            player_set_state(player_state_spring, true);
        }
        else input_lock_alarm = 16;

        x = _inst.x;
        if (dcos(spring_angle) != 0) image_xscale = sign(dcos(spring_angle));

        with (_inst)
        {
            active = true;

            if (is_dash_ring)
            {
                if (rainbow_score)
                {
                    rainbow_score = false;
                    stage_add_score(1000);
                }
            }

            if (sfx_alarm == 0)
            {
                sfx_alarm = 8;

                switch (object_index)
                {
                    case obj_dash_ring:
                        audio_play_sfx(pick(rainbow_ring, "snd_dash_ring", "snd_rainbow_ring"), true);
                        break;

                    default:
                        audio_play_sfx("snd_spring", true);
                }
            }
        }
    }
}