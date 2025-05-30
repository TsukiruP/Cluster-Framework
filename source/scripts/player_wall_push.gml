/// player_wall_push(obj, dir)
/// @desc Sets the animation for pushing, and moves the solid if possible.
/// @param {object}  obj
/// @param {int} dir
/// @returns {void}

var _obj; _obj = argument0;
var _dir; _dir = argument1;

if (state_current != player_state_run || tag_leader_state == STATE_FINISH) exit;

// Animate:
player_set_animation("push");

// Get movement vectors:
var ox; ox = dcos(angle) * _dir;
var oy; oy = dsin(angle) * _dir;

with (_obj)
{
    // Abort:
    if ((!can_push || y - yprevious != 0) || place_meeting(x + ox, y - oy, par_solid)) exit;

    // Move object:
    x += ox;
    y -= oy;
}

// Move player:
x += ox;
y -= oy;
