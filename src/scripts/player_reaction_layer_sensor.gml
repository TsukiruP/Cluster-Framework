/// player_reaction_layer_sensor(inst, hitbox)
/// @desc Like an onion.
/// @params {object} inst
/// @params {int} hitbox
/// @returns {void}

var _inst; _inst = argument0;
var _hitbox; _hitbox = argument1;

if (_hitbox & HIT_INTERACT) // && point_in_rectangle(x, y, _inst.bbox_left, _inst.bbox_top, _inst.bbox_right, _inst.bbox_bottom))
{
    layer = _inst.layer;
}
