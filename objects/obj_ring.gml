#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Ring Initialization

event_inherited();
magnetized = false;
lifespan = 0;
x_speed = 0;
y_speed = 0;
gravity_force = 0.09375;
layer = -1;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Create Magnetized Ring

if (magnetized)
{
    with (instance_create(x, y, obj_ring_magnetized)) super = other.super;
}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Lifespan

if (game_ispaused()) exit;

if (dropped)
{
    lifespan = max(lifespan - 1 * game_get_speed(), 0);
    if (lifespan <= 0) instance_destroy();
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement

event_inherited();

if (game_ispaused() || !dropped) exit;

if (!in_view()) instance_destroy();

var sine, csine, ox, oy;

sine = dsin(gravity_direction);
csine = dcos(gravity_direction);
ox = csine * x_speed;
oy = sine * x_speed;
x += ox;
y -= oy;

if (place_meeting(x + ox, y - oy, par_solid) && !place_meeting(xprevious, yprevious, par_solid))
{
    while (place_meeting(x, y, par_solid))
    {
        x -= sign(ox);
        y += sign(oy);
    }

    x_speed *= -1;
}

ox = sine * y_speed;
oy = csine * y_speed;
x += ox;
y += oy;

y_speed += gravity_force * game_get_speed();

if (place_meeting(x + ox, y + oy, par_solid) && !place_meeting(xprevious, yprevious, par_solid))
{
    while (place_meeting(x, y, par_solid))
    {
        x -= sign(ox);
        y -= sign(oy);
    }

    y_speed *= -1;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Magnetize

if (game_ispaused()) exit;

if (instance_exists(stage_get_player(0)))
{
    var player_id;

    player_id = stage_get_player(0);

    if (player_id.status_shield == SHIELD_MAGNETIC || player_id.status_shield == SHIELD_LIGHTNING)
    {
        if (distance_to_object(player_id) < 64)
        {
            magnetized = true;
            instance_destroy();
        }
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Ring

image_alpha = pick((dropped && lifespan < 30), 1, time_sync(lifespan, 2, 2));
draw_self_floored();
