/// player_reaction_explosive(obj, hitbox)
/// @desc A beautiful explosive force like fireworks.
/// @param {object} obj
/// @param {int} hitbox
/// @returns {void}

var _obj; _obj = argument0;
var _hitbox; _hitbox = argument1;

if ((_hitbox & HIT_HURT) && status_shield != SHIELD_FIRE)
{
    player_set_damage(_obj);
    with (_obj) explosive_destroy();
}
