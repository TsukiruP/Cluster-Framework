/// player_wall_push(obj, direction)
// Sisyphus Adventure 3.

var push_handle, ox, oy;

// Initialize:
ox = dcos(angle) * argument1;
oy = dsin(angle) * argument1;
wall_push = true;

with (argument0)
{
    // Abort:
    if ((can_push == false || y - yprevious != 0) || place_meeting(x + ox, y - oy, par_terrain))
    {
        exit;
    }

    // Move object:
    x += ox;
    y -= oy;
}

// Move player:
x += ox;
y -= oy;
