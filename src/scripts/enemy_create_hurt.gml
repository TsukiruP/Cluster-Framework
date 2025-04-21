/// enemy_create_hurt(obj)
/// @desc Creates the enemy hurt effect within the hurtbox.
/// @param {object} obj
/// @returns {void}

var _obj; _obj = argument0;

var x_int; x_int = floor(_obj.x);
var y_int; y_int = floor(_obj.y);
var left; left = _obj.hurtbox_left;
var top; top = _obj.hurtbox_top;
var right; right = _obj.hurtbox_right;
var bottom; bottom = _obj.hurtbox_bottom;
var dir_x; dir_x = sign(_obj.image_xscale);
var dir_y; dir_y = sign(_obj.image_yscale);
var off_x; off_x = _obj.hurtbox_x_offset * dir_x;
var off_y; off_y = _obj.hurtbox_y_offset * dir_y;
var rot; rot = _obj.gravity_direction;
var sine; sine = dsin(rot);
var csine; csine = dcos(rot);

var x1; x1 = x_int - (csine * left) + (csine * off_x) - (sine * top) + (sine * off_y);
var y1; y1 = y_int - (sine * right) + (sine * off_x) - (csine * top) + (csine * off_y);
var x2; x2 = x_int + (csine * right) + (csine * off_x) + (sine * bottom) + (sine * off_y);
var y2; y2 = y_int + (sine * left) - (sine * off_x) + (csine * bottom) + (csine * off_y);

var hurt_x; hurt_x = clamp(floor(x), x1, x2);
var hurt_y; hurt_y = clamp(floor(y), y1, y2);

effect_create(hurt_x, hurt_y, seq_enemy_hurt);
