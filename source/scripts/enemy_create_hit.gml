/// enemy_create_hit(obj)
/// @desc Creates the enemy hit effect within the hurtbox.
/// @param {object} obj
/// @returns {void}

var _obj; _obj = argument0;

var hurt_x; hurt_x = clamp(floor(x), _obj.bbox_left, _obj.bbox_right);
var hurt_y; hurt_y = clamp(floor(y), _obj.bbox_top, _obj.bbox_bottom);

effect_create(hurt_x, hurt_y, seq_enemy_hit);
