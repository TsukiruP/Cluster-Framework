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

if (place_meeting(x + ox, y - oy, par_terrain) && !place_meeting(xprevious, yprevious, par_terrain))
{
    while (place_meeting(x, y, par_terrain))
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

if (place_meeting(x + ox, y + oy, par_terrain) && !place_meeting(xprevious, yprevious, par_terrain))
{
    while (place_meeting(x, y, par_terrain))
    {
        x -= sign(ox);
        y -= sign(oy);
    }

    y_speed *= -1;
}

/*
var sine, csine;

sine = dsin(gravity_direction);
csine = dcos(gravity_direction);

// Add gravity:
y_speed += gravity_force * game_get_speed();

// Apply x speed:
if (x_speed != 0)
{
    x += dcos(gravity_direction) * (x_speed * game_get_speed());
    y -= dsin(gravity_direction) * (x_speed * game_get_speed());
}

// Apply y speed:
if (y_speed != 0)
{
    x += dsin(gravity_direction) * (y_speed * game_get_speed());
    y += dcos(gravity_direction) * (y_speed * game_get_speed());
}

// Left eject:
while (collision_ray_vertical(-hurtbox_left, 0, gravity_direction, par_terrain))
{
    x += csine * hurtbox_left;
    y -= sine * hurtbox_left;
}

// Right eject:
while (collision_ray_vertical(hurtbox_right, 0, gravity_direction, par_terrain))
{
    x -= csine * hurtbox_right;
    y += sine * hurtbox_right;
}

// Inverse x speed:
if (collision_ray_vertical(-(hurtbox_left + 1), 0, gravity_direction, par_terrain) || collision_ray_vertical(hurtbox_right + 1, 0, gravity_direction, par_terrain))
{
    x_speed *= -1;
}

// Rise up:
while (collision_box_vertical(hurtbox_left, hurtbox_bottom, gravity_direction, par_terrain))
{
    x -= sine;
    y -= csine;
}

// Sink down:
while (collision_box_vertical(hurtbox_left, hurtbox_top + 1, angle_wrap(gravity_direction + 180), par_terrain))
{
    x += sine;
    y += csine;
}

// Inverse y speed:
if (collision_box_vertical(hurtbox_left, hurtbox_bottom + 1, gravity_direction, par_terrain) || collision_box_vertical(hurtbox_left, hurtbox_top + 2, angle_wrap(gravity_direction + 180), par_terrain))
{
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
    var player_handle;

    player_handle = stage_get_player(0);

    if (player_handle.status_shield == SHIELD_MAGNETIC || player_handle.status_shield == SHIELD_LIGHTNING)
    {
        if (distance_to_object(player_handle) < 64)
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
