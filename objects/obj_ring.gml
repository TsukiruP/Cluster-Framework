#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Ring Initialization

event_inherited();

// Flags:
magnetized = false;
lifespan = 0;

// Physics variables:
x_speed = 0;
y_speed = 0;
gravity_force = 0.09375;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Create Magnetized Ring

if (magnetized == true)
{
    instance_create(x, y, obj_ring_magnetized);
}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Lifespan

// Exit if the stage is paused or text is active:
if (game_ispaused())
{
    exit;
}

if (dropped == true)
{
    // Decrease lifespan alarm:
    lifespan = max(lifespan - 1 * global.game_speed, 0);

    // Destroy:
    if (lifespan <= 0)
    {
        instance_destroy();
    }
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement

// Animation:
event_inherited();

// Exit if the stage is paused or text is active:
if (game_ispaused() || dropped == false)
{
    exit;
}

// Destroy if out of view:
if (!in_view())
{
    instance_destroy();
}

var sine, csine;

sine = dsin(gravity_direction);
csine = dcos(gravity_direction);

// Add gravity:
y_speed += gravity_force * global.game_speed;

// Apply x speed:
if (x_speed != 0)
{
    x += dcos(gravity_direction) * (x_speed * global.game_speed);
    y -= dsin(gravity_direction) * (x_speed * global.game_speed);
}

// Apply y speed:
if (y_speed != 0)
{
    x += dsin(gravity_direction) * (y_speed * global.game_speed);
    y += dcos(gravity_direction) * (y_speed * global.game_speed);
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

// Exit if the stage is paused or text is active:
if (game_ispaused())
{
    exit;
}

if (instance_exists(player_get_instance(0)))
{
    var player_handle;

    // Player handle:
    player_handle = player_get_instance(0);

    // Change instance:
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

// Ring:
if (dropped == false || lifespan >= 90 || (dropped == true && lifespan < 90 && (lifespan div 4) mod 2))
{
    draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}

// Collision:
event_inherited();
