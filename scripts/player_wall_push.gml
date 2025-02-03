/// player_wall_push(obj, direction)
/* Sisyphus Adventure 3.
Sets the push animation and pushes the object if possible. */

if (state_current != player_state_run) exit;

var ox, oy;

// Animate:
player_set_animation("push");

// Get movement vectors:
ox = dcos(angle) * argument1;
oy = dsin(angle) * argument1;

with (argument0)
{
    // Abort:
    if ((!can_push || y - yprevious != 0) || place_meeting(x + ox, y - oy, par_terrain)) exit;

    // Move object:
    x += ox;
    y -= oy;
}

// Move player:
x += ox;
y -= oy;
