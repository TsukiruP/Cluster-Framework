/// enemy_get_player(range, [alert])
/// @desc Returns the nearest player instance.
/// @param {int} range
/// @param {bool} [alert]
/// @returns {object}

var _range; _range = argument[0];
var _alert; if (argument_count > 1) _alert = argument[1]; else _alert = false;

var player_inst; player_inst = instance_nearest(x, y, obj_player);

if (instance_exists(player_inst))
{
    var player_solid; player_solid = collision_line(x, y, player_inst.x, player_inst.y, par_solid, true, false);
    var player_angle; player_angle = pick(sign(image_xscale) == -1, gravity_direction, angle_wrap(gravity_direction + 180));
    var player_difference; player_difference = abs(angle_difference(player_angle, direction_to_object(player_inst)));

    if (instance_exists(player_solid) || distance_to_object(player_inst) >= _range || player_difference >= 45 || player_inst.state_current == player_state_death) player_inst = noone;
    else if (_alert)
    {
        effect_create(x, y - 40, seq_enemy_alert);
        audio_play_sfx("snd_enemy_alert", true);
    }
}

return player_inst;
