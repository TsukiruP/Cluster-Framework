/// enemy_get_player_below(range, [alert])
/// @desc Returns the nearest player instance below the enemy.
/// @param {int} range
/// @param {bool} [alert]
/// @returns {object}

var _range; _range = argument[0];
var _alert; if (argument_count > 1) _alert = argument[1]; else _alert = false;

var player_inst; player_inst = instance_nearest(x, y, obj_player);

if (instance_exists(player_inst))
{
    var player_solid; player_solid = collision_line(x, y, player_inst.x, player_inst.y, par_solid, true, false);
    var player_distance; player_distance = abs(x - player_inst.x);

    if (y > player_inst.y || instance_exists(player_solid) || player_distance >= _range || player_inst.state_current == player_state_death) player_inst = noone;
    else if (_alert) enemy_alert_create();
}

return player_inst;
